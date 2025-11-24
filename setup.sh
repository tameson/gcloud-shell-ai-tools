#!/bin/bash
# One-time setup script for Cloud Shell AI Team Environment
# Run this after cloning the repo: ./setup.sh

set -e

echo "========================================"
echo "  Cloud Shell AI Team - Setup"
echo "========================================"
echo ""

# Install the boot script
echo "Installing boot script (~/.customize_environment)..."
cp customize_environment ~/.customize_environment
chmod +x ~/.customize_environment

# Run the boot script now to install everything
echo ""
echo "Running installation (this may take a minute)..."
bash ~/.customize_environment

echo ""
echo "========================================"
echo "  Setup Complete!"
echo "========================================"
echo ""
echo "Available commands:"
echo "  claude  - Anthropic Claude Code"
echo "  codex   - OpenAI Codex"
echo "  gemini  - Google Gemini CLI"
echo ""
echo "Start a new terminal or run: source ~/.bashrc"
echo ""
