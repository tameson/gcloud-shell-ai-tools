FROM gcr.io/cloudshell-images/cloudshell:latest

# Build arguments for API keys (passed during build, baked into image)
ARG ANTHROPIC_API_KEY
ARG OPENAI_API_KEY

# Install uv (required for bigquery-mcp via 'uvx' command)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    mv /root/.local/bin/uv /usr/local/bin/uv && \
    mv /root/.local/bin/uvx /usr/local/bin/uvx

# Install AI coding tools and Ruler via npm
# Cloud Shell uses nvm-managed node, source nvm explicitly
RUN export NVM_DIR="/usr/local/nvm" && \
    . "$NVM_DIR/nvm.sh" && \
    npm install -g \
        @anthropic-ai/claude-code \
        @openai/codex \
        @google/gemini-cli \
        @intellectronica/ruler

# Create configuration directories
RUN mkdir -p /root/.claude /root/.codex /root/.gemini /root/.config/ruler

# Copy Ruler configuration (source of truth for MCP across all agents)
COPY .ruler/ /root/.config/ruler/

# Copy documentation
COPY README.md /root/README.md

# Apply Ruler to generate MCP configs for all agents
WORKDIR /root
RUN export NVM_DIR="/usr/local/nvm" && . "$NVM_DIR/nvm.sh" && \
    ruler apply --no-gitignore || true

# Set API keys as environment variables (baked into image)
ENV ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# Configure Claude Code to use the API key via helper script
RUN mkdir -p /root/.claude && \
    echo '#!/bin/bash' > /root/.claude/get-api-key.sh && \
    echo 'echo "$ANTHROPIC_API_KEY"' >> /root/.claude/get-api-key.sh && \
    chmod +x /root/.claude/get-api-key.sh

# Pre-authenticate Codex with the API key (creates auth.json)
RUN export NVM_DIR="/usr/local/nvm" && . "$NVM_DIR/nvm.sh" && \
    if [ -n "$OPENAI_API_KEY" ]; then \
        echo "$OPENAI_API_KEY" | codex login --with-api-key 2>/dev/null || true; \
    fi

# Setup welcome message in bashrc
RUN echo '' >> /root/.bashrc && \
    echo '# Welcome message' >> /root/.bashrc && \
    echo 'echo ""' >> /root/.bashrc && \
    echo 'echo "Cloud Shell AI Team Environment"' >> /root/.bashrc && \
    echo 'echo "================================"' >> /root/.bashrc && \
    echo 'echo ""' >> /root/.bashrc && \
    echo 'echo "Available commands:"' >> /root/.bashrc && \
    echo 'echo "  claude  - Anthropic Claude Code"' >> /root/.bashrc && \
    echo 'echo "  codex   - OpenAI Codex"' >> /root/.bashrc && \
    echo 'echo "  gemini  - Google Gemini (uses your Google account)"' >> /root/.bashrc && \
    echo 'echo ""' >> /root/.bashrc && \
    echo 'echo "MCP servers: bigquery, context7, chrome-devtools, product_search"' >> /root/.bashrc && \
    echo 'echo ""' >> /root/.bashrc

WORKDIR /root
