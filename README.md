# Cloud Shell AI Team Environment

Pre-configured AI coding assistants (Claude Code, Codex, Gemini CLI) with shared MCP servers for Google Cloud Shell.

## Quick Start

### One-Click Setup

Click the button below to open Cloud Shell and clone this repo:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://gitlab.com/tameson/ai-tools/gcloud-shell-team.git&cloudshell_git_branch=customize-environment&cloudshell_workspace=gcloud-shell-team&cloudshell_print=cloudshell_open)

Then run:
```bash
./setup.sh
source ~/.bashrc
```

That's it! API keys are automatically fetched from Secret Manager.

### Manual Setup

```bash
git clone -b customize-environment https://gitlab.com/tameson/ai-tools/gcloud-shell-team.git
cd gcloud-shell-team
./setup.sh
source ~/.bashrc
```

## Available Commands

| Command | Description |
|---------|-------------|
| `claude` | Anthropic Claude Code |
| `codex` | OpenAI Codex |
| `gemini` | Google Gemini CLI (uses your Google account) |

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
2. Installs Claude Code, Codex, Gemini CLI, and Ruler
3. Fetches API keys from Secret Manager (if you have access)
4. Configures MCP servers for all AI tools via Ruler

### Access Requirements

To get API keys automatically, you must be a member of `data-product@tameson.com`.
If you're not in the group, you can still use Gemini (uses your Google account).

## Admin Setup

Admins can manage API keys using:
```bash
./admin-setup.sh
```

This creates/updates secrets in Secret Manager (`bi-project-392012`):
- `ai-tools-anthropic-key`
- `ai-tools-openai-key`

## Updating

Pull the latest and re-run setup:
```bash
cd gcloud-shell-team
git pull
./setup.sh
```

## Files

```
.
├── setup.sh                 # User setup script
├── admin-setup.sh           # Admin script for managing secrets
├── customize_environment    # Cloud Shell boot script
├── cloudshell_open          # Instructions shown on Cloud Shell open
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
cd ~/gcloud-shell-team
ruler apply --verbose
```

### Check installed tools
```bash
which claude codex gemini
```
