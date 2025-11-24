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

# Check if secrets exist and create if needed
SECRETS="ai-tools-anthropic-key ai-tools-openai-key ai-tools-product-search-token"

for SECRET in $SECRETS; do
    if ! gcloud secrets describe "$SECRET" --project="$PROJECT_ID" &>/dev/null; then
        echo "Creating $SECRET..."
        gcloud secrets create "$SECRET" --project="$PROJECT_ID"
        gcloud secrets add-iam-policy-binding "$SECRET" \
            --project="$PROJECT_ID" \
            --member="group:$GROUP_EMAIL" \
            --role="roles/secretmanager.secretAccessor" --quiet
    fi
done

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

read -p "Product Search Token (JWT): " PRODUCT_SEARCH_TOKEN
if [ -n "$PRODUCT_SEARCH_TOKEN" ]; then
    echo -n "$PRODUCT_SEARCH_TOKEN" | gcloud secrets versions add ai-tools-product-search-token --project="$PROJECT_ID" --data-file=-
    echo "✓ Product Search token updated"
fi

echo ""
echo "========================================"
echo "  Setup Complete!"
echo "========================================"
echo ""
echo "Secrets are accessible by: $GROUP_EMAIL"
echo ""
