# Tameson Data Assistant

Claude Code pre-configured to query the Tameson datalake.

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/tameson/gcloud-shell-ai-tools.git&cloudshell_tutorial=tutorial.md&show=ide&cloudshell_workspace=.)

## Quick Start

1. Click the button above
2. Follow the tutorial in Cloud Shell
3. Run `claude` to start

## What's Included

- **BigQuery** - Query the Tameson datalake (prefer `3_Marts` and `4_Reports`)
- **Product Search** - Search the Tameson product catalog
- **Context7** - Library documentation lookup
- **Markitdown** - Convert documents to markdown

Research findings are saved to `/outputs` with full documentation of queries and reasoning.

## Manual Setup

```bash
git clone https://github.com/tameson/gcloud-shell-ai-tools.git
cd gcloud-shell-ai-tools
./setup.sh
claude
```
