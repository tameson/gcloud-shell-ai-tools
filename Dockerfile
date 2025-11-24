FROM gcr.io/cloudshell-images/cloudshell:latest

# Install uv (required for bigquery-mcp via 'uvx' command)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    mv /root/.cargo/bin/uv /usr/local/bin/uv && \
    mv /root/.cargo/bin/uvx /usr/local/bin/uvx

# Install AI coding tools and Ruler via npm
RUN npm install -g \
    @anthropic-ai/claude-code \
    @openai/codex \
    @google/gemini-cli \
    @intellectronica/ruler

# Pull MCP server Docker image for markitdown
RUN docker pull mcp/markitdown:latest 2>/dev/null || true

# Create configuration directories
RUN mkdir -p /root/.claude /root/.codex /root/.gemini /root/.config/ruler

# Copy Ruler configuration (source of truth for MCP across all agents)
COPY .ruler/ /root/.config/ruler/

# Copy scripts
COPY scripts/ /root/scripts/
RUN chmod +x /root/scripts/*.sh

# Copy documentation
COPY README.md /root/README.md

# Apply Ruler to generate MCP configs for all agents
# This creates .claude/config.json, .codex/mcp.json, .gemini/settings.json
WORKDIR /root
RUN ruler apply --no-gitignore || true

# Create the API key helper script for Claude (will be configured at runtime)
RUN mkdir -p /root/.claude && \
    echo '#!/bin/bash' > /root/.claude/get-api-key.sh && \
    echo 'source "$HOME/.ai-keys" 2>/dev/null' >> /root/.claude/get-api-key.sh && \
    echo 'echo "$ANTHROPIC_API_KEY"' >> /root/.claude/get-api-key.sh && \
    chmod +x /root/.claude/get-api-key.sh

# Setup bashrc for automatic key loading and welcome message
RUN echo '' >> /root/.bashrc && \
    echo '# Load AI API keys if available' >> /root/.bashrc && \
    echo '[ -f "$HOME/.ai-keys" ] && source "$HOME/.ai-keys"' >> /root/.bashrc && \
    echo '' >> /root/.bashrc && \
    echo '# Welcome message' >> /root/.bashrc && \
    echo 'echo ""' >> /root/.bashrc && \
    echo 'echo "Welcome to Cloud Shell AI Team Environment"' >> /root/.bashrc && \
    echo 'echo "==========================================="' >> /root/.bashrc && \
    echo 'echo ""' >> /root/.bashrc && \
    echo 'if [ ! -f "$HOME/.ai-keys" ]; then' >> /root/.bashrc && \
    echo '  echo "Run setup-keys to configure your API keys:"' >> /root/.bashrc && \
    echo '  echo "  ~/scripts/setup-keys.sh"' >> /root/.bashrc && \
    echo '  echo ""' >> /root/.bashrc && \
    echo 'else' >> /root/.bashrc && \
    echo '  echo "Available commands: claude, codex, gemini"' >> /root/.bashrc && \
    echo '  echo "Run ~/scripts/setup-keys.sh to update API keys"' >> /root/.bashrc && \
    echo '  echo ""' >> /root/.bashrc && \
    echo 'fi' >> /root/.bashrc && \
    echo 'echo "See ~/README.md for documentation"' >> /root/.bashrc && \
    echo 'echo ""' >> /root/.bashrc

# Create convenience alias
RUN echo 'alias setup-keys="~/scripts/setup-keys.sh"' >> /root/.bashrc

WORKDIR /root
