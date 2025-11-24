#!/bin/bash
set -e

echo "=================================="
echo "  Claude Code Setup"
echo "=================================="
echo ""

# Check gcloud auth
echo "[1/4] Checking Google Cloud authentication..."
if gcloud auth list --filter=status:ACTIVE --format="value(account)" | head -1 | grep -q "@"; then
    ACCOUNT=$(gcloud auth list --filter=status:ACTIVE --format="value(account)" | head -1)
    echo "      Authenticated as: $ACCOUNT"
else
    echo "      Not authenticated. Please run: gcloud auth login"
    exit 1
fi
echo ""

# Install uv (Python package manager)
echo "[2/4] Installing dependencies..."
if ! command -v uv &> /dev/null; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi
echo "      uv installed"
echo ""

# Install Claude Code
echo "[3/4] Installing Claude Code..."
if ! command -v claude &> /dev/null; then
    # Ensure npm is available
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm install -g @anthropic-ai/claude-code
fi
echo "      Claude Code installed"
echo ""

# Setup MCP config in home directory
echo "[4/4] Configuring MCP servers..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.claude"
cp "$SCRIPT_DIR/.mcp.json" "$HOME/.claude/.mcp.json"

# Copy project settings with pre-approved permissions
if [ -d "$SCRIPT_DIR/.claude" ]; then
    cp -r "$SCRIPT_DIR/.claude/"* "$HOME/.claude/" 2>/dev/null || true
fi
echo "      MCP servers configured"
echo ""

echo "=================================="
echo "  Setup Complete!"
echo "=================================="
echo ""
echo "Run 'claude' to start Claude Code"
echo ""
