# Cloud Shell AI Tools

Pre-configured AI coding assistants (Claude Code, Codex) with shared MCP servers for Google Cloud Shell.

## Quick Start

### One-Click Setup

Click the button below to open Cloud Shell:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/tameson/gcloud-shell-ai-tools.git&cloudshell_print=QUICKSTART.txt)

Then run:
```bash
./setup.sh
source ~/.bashrc
```

API keys are automatically loaded from Secret Manager.

### Manual Setup

```bash
git clone https://github.com/tameson/gcloud-shell-ai-tools.git
cd gcloud-shell-ai-tools
./setup.sh
source ~/.bashrc
```

## Available Commands

| Command | Description |
|---------|-------------|
| `claude` | Anthropic Claude Code |
| `codex` | OpenAI Codex |

## Pre-Configured MCP Servers

All AI tools share these MCP servers (via [Ruler](https://github.com/intellectronica/ruler)):

| Server | Description |
|--------|-------------|
| **bigquery** | Query BigQuery datasets |
| **context7** | Library documentation lookup |
| **chrome-devtools** | Browser automation |
| **product_search** | Product search API |

## How It Works

1. `setup.sh` installs `~/.customize_environment` (runs on Cloud Shell boot)
2. Installs Claude Code, Codex, and Ruler
3. Fetches API keys from Secret Manager (if you have access)
4. Configures Claude/Codex to use API keys without login prompts
5. Configures MCP servers for all AI tools via Ruler

### Access Requirements

To get API keys automatically, you must be a member of `data-product@tameson.com`.

## Admin Setup

Admins can manage API keys using:
```bash
./admin-setup.sh
```

This creates/updates secrets in Secret Manager (`bi-project-392012`):
- `ai-tools-anthropic-key`
- `ai-tools-openai-key`
- `ai-tools-product-search-token`

## Updating

Pull the latest and re-run setup:
```bash
cd ~/cloudshell_open/gcloud-shell-ai-tools
git pull
./setup.sh
```

## Files

```
.
├── setup.sh                 # User setup script
├── admin-setup.sh           # Admin script for managing secrets
├── customize_environment    # Cloud Shell boot script
├── QUICKSTART.txt           # Instructions printed on Cloud Shell open
├── README.md
└── .ruler/
    ├── AGENTS.md            # Agent instructions
    ├── ruler.toml           # Ruler configuration
    └── mcp.json             # MCP server definitions
```

## Troubleshooting

### Tools not found after restart
```bash
bash ~/.customize_environment
source ~/.bashrc
```

### API keys not working
```bash
# Check if you have access to Secret Manager
gcloud secrets versions access latest --secret="ai-tools-anthropic-key" --project="bi-project-392012"
```

### MCP servers not working
```bash
cd ~/cloudshell_open/gcloud-shell-ai-tools
ruler apply --verbose
```

### Check installed tools
```bash
which claude codex
```
