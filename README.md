# Cloud Shell AI Team Environment

Pre-configured AI coding assistants (Claude Code, Codex, Gemini CLI) with shared MCP servers for Google Cloud Shell.

## Quick Start

### Option 1: One-Click Setup (Recommended)

Click the button below to open Cloud Shell and automatically clone this repo:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://gitlab.com/tameson/ai-tools/gcloud-shell-team.git&cloudshell_git_branch=customize-environment&cloudshell_workspace=gcloud-shell-team&cloudshell_print=cloudshell_open)

Then run:
```bash
./setup.sh
```

### Option 2: Manual Setup

```bash
# Clone the repo
git clone -b customize-environment https://gitlab.com/tameson/ai-tools/gcloud-shell-team.git
cd gcloud-shell-team

# Run setup (installs tools, configures MCP)
./setup.sh
```

### Option 3: With API Keys Pre-configured

```bash
cd gcloud-shell-team
export ANTHROPIC_API_KEY="sk-ant-..."
export OPENAI_API_KEY="sk-..."
./setup.sh
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

## Setting API Keys

### Claude Code (Anthropic)
```bash
export ANTHROPIC_API_KEY="sk-ant-..."
```
Get your key: https://console.anthropic.com/settings/keys

### Codex (OpenAI)
```bash
export OPENAI_API_KEY="sk-..."
```
Get your key: https://platform.openai.com/api-keys

### Gemini CLI
Uses your Google account automatically (no key needed in Cloud Shell).

### Save Keys Permanently
```bash
cat >> ~/.ai-keys << 'EOF'
export ANTHROPIC_API_KEY="sk-ant-..."
export OPENAI_API_KEY="sk-..."
EOF
chmod 600 ~/.ai-keys
```

## How It Works

1. `setup.sh` installs the `~/.customize_environment` script
2. Cloud Shell runs this script on every boot
3. Tools are installed to `$HOME` (persists across sessions)
4. MCP configuration is managed by Ruler in `.ruler/` (run from repo directory)

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
├── setup.sh                 # One-time setup script
├── customize_environment    # Cloud Shell boot script
├── README.md
└── .ruler/
    ├── AGENTS.md            # Agent instructions
    ├── ruler.toml           # Ruler configuration
    └── mcp.json             # MCP server definitions
```

## Troubleshooting

### Tools not found after restart
```bash
# Re-run the boot script manually
bash ~/.customize_environment
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
