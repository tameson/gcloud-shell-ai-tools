#!/bin/bash
# Admin script for managing AI tools secrets in Secret Manager
# Run this to create or update API keys

set -e

PROJECT_ID="bi-project-392012"
GROUP_EMAIL="data-product@tameson.com"

echo "========================================"
echo "  AI Tools - Admin Secret Setup"
echo "========================================"
echo ""

# Check if secrets exist
echo "Checking secrets..."
ANTHROPIC_EXISTS=$(gcloud secrets describe ai-tools-anthropic-key --project="$PROJECT_ID" 2>/dev/null && echo "yes" || echo "no")
OPENAI_EXISTS=$(gcloud secrets describe ai-tools-openai-key --project="$PROJECT_ID" 2>/dev/null && echo "yes" || echo "no")

# Create secrets if they don't exist
if [ "$ANTHROPIC_EXISTS" = "no" ]; then
    echo "Creating ai-tools-anthropic-key secret..."
    gcloud secrets create ai-tools-anthropic-key --project="$PROJECT_ID"
    gcloud secrets add-iam-policy-binding ai-tools-anthropic-key \
        --project="$PROJECT_ID" \
        --member="group:$GROUP_EMAIL" \
        --role="roles/secretmanager.secretAccessor" --quiet
fi

if [ "$OPENAI_EXISTS" = "no" ]; then
    echo "Creating ai-tools-openai-key secret..."
    gcloud secrets create ai-tools-openai-key --project="$PROJECT_ID"
    gcloud secrets add-iam-policy-binding ai-tools-openai-key \
        --project="$PROJECT_ID" \
        --member="group:$GROUP_EMAIL" \
        --role="roles/secretmanager.secretAccessor" --quiet
fi

echo ""
echo "Enter API keys (or press Enter to skip):"
echo ""

read -p "Anthropic API Key (sk-ant-...): " ANTHROPIC_KEY
if [ -n "$ANTHROPIC_KEY" ]; then
    echo -n "$ANTHROPIC_KEY" | gcloud secrets versions add ai-tools-anthropic-key --project="$PROJECT_ID" --data-file=-
    echo "✓ Anthropic key updated"
fi

read -p "OpenAI API Key (sk-...): " OPENAI_KEY
if [ -n "$OPENAI_KEY" ]; then
    echo -n "$OPENAI_KEY" | gcloud secrets versions add ai-tools-openai-key --project="$PROJECT_ID" --data-file=-
    echo "✓ OpenAI key updated"
fi

echo ""
echo "========================================"
echo "  Setup Complete!"
echo "========================================"
echo ""
echo "Secrets are accessible by: $GROUP_EMAIL"
echo ""
