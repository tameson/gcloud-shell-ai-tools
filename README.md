# Cloud Shell AI Team Environment

A custom Google Cloud Shell environment with pre-configured AI coding assistants (Claude Code, Codex, Gemini CLI) and shared MCP servers.

## Quick Start (For Team Members)

Click the button below to open Cloud Shell with this custom environment:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/YOUR_ORG/gcloud-shell-team&cloudshell_image=europe-west4-docker.pkg.dev/YOUR_PROJECT/cloudshell-images/cloudshell-ai-team:latest)

> **Note**: Replace `YOUR_ORG` and `YOUR_PROJECT` with your actual values.

### First-Time Setup

1. Run the setup script to configure your API keys:
   ```bash
   setup-keys
   # or: ~/scripts/setup-keys.sh
   ```

2. Enter your API keys when prompted:
   - **Anthropic**: Get from https://console.anthropic.com/settings/keys
   - **OpenAI**: Get from https://platform.openai.com/api-keys
   - **Google**: Get from https://aistudio.google.com/apikey

3. Start using the AI tools:
   ```bash
   claude    # Claude Code
   codex     # OpenAI Codex
   gemini    # Google Gemini CLI
   ```

Your API keys are stored in `~/.ai-keys` and persist across Cloud Shell sessions.

## Included Tools

| Tool | Command | Description |
|------|---------|-------------|
| Claude Code | `claude` | Anthropic's AI coding assistant |
| Codex | `codex` | OpenAI's coding assistant |
| Gemini CLI | `gemini` | Google's AI assistant |
| Ruler | `ruler` | MCP configuration manager |

## Pre-Configured MCP Servers

All AI tools share the same MCP (Model Context Protocol) servers:

| Server | Description | Usage |
|--------|-------------|-------|
| **bigquery** | Query BigQuery datasets | Data analysis, SQL queries |
| **context7** | Library documentation | Look up API docs for any library |
| **markitdown** | Document conversion | Convert URLs/files to markdown |
| **chrome-devtools** | Browser automation | Web testing and scraping |

MCP configuration is managed by [Ruler](https://github.com/intellectronica/ruler) and stored in `~/.config/ruler/`.

---

## Deployment Guide (For Admins)

### Prerequisites

1. A Google Cloud project with billing enabled
2. Enable required APIs:
   ```bash
   gcloud services enable \
     cloudbuild.googleapis.com \
     artifactregistry.googleapis.com
   ```

### Step 1: Create Artifact Registry Repository

```bash
# Create repository for Docker images
gcloud artifacts repositories create cloudshell-images \
  --repository-format=docker \
  --location=europe-west4 \
  --description="Cloud Shell custom images"

# Make repository public (required for Cloud Shell to pull images)
gcloud artifacts repositories add-iam-policy-binding cloudshell-images \
  --location=europe-west4 \
  --member=allUsers \
  --role=roles/artifactregistry.reader
```

### Step 2: Build and Push Image

#### Option A: Using Cloud Build (Recommended)

```bash
# Submit build to Cloud Build
gcloud builds submit --config=cloudbuild.yaml .
```

#### Option B: Build Locally

```bash
# Set variables
PROJECT_ID=$(gcloud config get-value project)
REGION=europe-west4
IMAGE=europe-west4-docker.pkg.dev/$PROJECT_ID/cloudshell-images/cloudshell-ai-team

# Build image
docker build -t $IMAGE:latest .

# Push to Artifact Registry
docker push $IMAGE:latest
```

### Step 3: Set Up CI/CD (Optional)

Create a Cloud Build trigger to auto-build on push:

```bash
gcloud builds triggers create github \
  --name="cloudshell-ai-team-build" \
  --repo-name="gcloud-shell-team" \
  --repo-owner="YOUR_ORG" \
  --branch-pattern="^main$" \
  --build-config="cloudbuild.yaml"
```

### Step 4: Generate Share Link

Create the "Open in Cloud Shell" link for your team:

```
https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/YOUR_ORG/gcloud-shell-team&cloudshell_image=europe-west4-docker.pkg.dev/YOUR_PROJECT/cloudshell-images/cloudshell-ai-team:latest
```

**Markdown button:**
```markdown
[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/YOUR_ORG/gcloud-shell-team&cloudshell_image=europe-west4-docker.pkg.dev/YOUR_PROJECT/cloudshell-images/cloudshell-ai-team:latest)
```

---

## MCP Configuration with Ruler

This project uses [Ruler](https://github.com/intellectronica/ruler) to manage MCP server configuration across all AI tools from a single source of truth.

### Configuration Files

```
.ruler/
├── AGENTS.md       # Instructions for all AI agents
└── ruler.toml      # MCP server definitions
```

### Modifying MCP Servers

1. Edit `.ruler/ruler.toml` to add/modify MCP servers
2. Rebuild the Docker image, or run `ruler apply` manually:
   ```bash
   cd ~/.config/ruler
   ruler apply
   ```

### Adding a New MCP Server

Add to `.ruler/ruler.toml`:

```toml
[mcp_servers.my_server]
command = "npx"
args = ["-y", "@some/mcp-server"]
```

Or for HTTP-based servers:

```toml
[mcp_servers.my_api]
url = "https://api.example.com/mcp"

[mcp_servers.my_api.headers]
Authorization = "Bearer ${MY_API_KEY}"
```

---

## Troubleshooting

### API Keys Not Working

```bash
# Check if keys are loaded
echo $ANTHROPIC_API_KEY
echo $OPENAI_API_KEY
echo $GEMINI_API_KEY

# Re-run setup
~/scripts/setup-keys.sh
```

### MCP Servers Not Available

```bash
# Re-apply Ruler configuration
cd ~/.config/ruler
ruler apply --verbose

# Check Claude's MCP config
cat ~/.claude/config.json
```

### Cloud Shell Image Not Loading

1. Verify the image is public:
   ```bash
   gcloud artifacts docker images describe \
     europe-west4-docker.pkg.dev/PROJECT/cloudshell-images/cloudshell-ai-team:latest
   ```

2. Check repository permissions:
   ```bash
   gcloud artifacts repositories get-iam-policy cloudshell-images \
     --location=europe-west4
   ```

---

## Project Structure

```
.
├── Dockerfile           # Cloud Shell custom image definition
├── cloudbuild.yaml      # Cloud Build configuration
├── README.md            # This file
├── mcp_config.json      # Legacy MCP config (kept for reference)
├── .ruler/
│   ├── AGENTS.md        # Agent instructions
│   └── ruler.toml       # MCP server definitions (source of truth)
└── scripts/
    └── setup-keys.sh    # API key configuration script
```

---

## Resources

- [Cloud Shell Custom Environments](https://cloud.google.com/shell/docs/custom-environments)
- [Open in Cloud Shell](https://cloud.google.com/shell/docs/open-in-cloud-shell)
- [Ruler Documentation](https://github.com/intellectronica/ruler)
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code)
- [OpenAI Codex CLI](https://github.com/openai/codex)
- [Gemini CLI](https://github.com/google/generative-ai-js)
