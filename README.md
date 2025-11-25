# Tameson Data Assistant - Cloud Shell setup

Claude Code pre-configured to query the Tameson datalake.

[![Setup in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/tameson/gcloud-shell-ai-tools.git&cloudshell_tutorial=tutorial.md&show=ide&cloudshell_workspace=.)

[![Open existing Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?show=ide&cloudshell_workspace=./cloudshell_open/gcloud-shell-ai-tools)

## Quick Start

1. Click the button above
2. Follow the tutorial in Cloud Shell
3. Run `claude` to start

## What's Included

- **BigQuery** - Query the Tameson datalake (prefer `3_Marts` and `4_Reports`)


Research findings are saved to `/outputs` with full documentation of queries and reasoning.

## Manual Setup

```bash
git clone https://github.com/tameson/gcloud-shell-ai-tools.git
cd gcloud-shell-ai-tools
./setup.sh
claude
```
