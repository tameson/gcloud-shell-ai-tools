#!/bin/bash
# One-time setup script for Cloud Shell AI Team Environment
# Run this after cloning the repo: ./setup.sh

set -e

echo "========================================"
echo "  Cloud Shell AI Team - Setup"
echo "========================================"
echo ""

# 1. Install customize_environment script
echo "[1/3] Installing boot script..."
cp customize_environment ~/.customize_environment
chmod +x ~/.customize_environment

# 2. Run the customize script now (installs tools)
echo "[2/3] Installing AI tools (this may take a minute)..."
bash ~/.customize_environment

# 3. Apply Ruler to generate MCP configs (run from repo dir where .ruler exists)
echo "[3/3] Applying MCP configuration..."
ruler apply --no-gitignore 2>/dev/null || true

# 4. Setup API keys if provided as env vars
if [ -n "$ANTHROPIC_API_KEY" ] || [ -n "$OPENAI_API_KEY" ]; then
    echo ""
    echo "Saving API keys..."
    cat > ~/.ai-keys << EOF
export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY}"
export OPENAI_API_KEY="${OPENAI_API_KEY}"
EOF
    chmod 600 ~/.ai-keys

    # Add to bashrc if not already there
    if ! grep -q "source.*\.ai-keys" ~/.bashrc 2>/dev/null; then
        echo '[ -f "$HOME/.ai-keys" ] && source "$HOME/.ai-keys"' >> ~/.bashrc
    fi
fi

echo ""
echo "========================================"
echo "  Setup Complete!"
echo "========================================"
echo ""
echo "Available commands:"
echo "  claude  - Anthropic Claude Code"
echo "  codex   - OpenAI Codex"
echo "  gemini  - Google Gemini (uses your Google account)"
echo ""
echo "To set API keys, run:"
echo "  export ANTHROPIC_API_KEY='sk-ant-...'"
echo "  export OPENAI_API_KEY='sk-...'"
echo "  ./setup.sh  # Re-run to save keys"
echo ""
echo "Or add them to ~/.ai-keys manually"
echo ""
