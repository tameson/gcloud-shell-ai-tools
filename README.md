# Tameson Data Assistant - Cloud Shell setup

Claude Code pre-configured to query the Tameson datalake.

[![Setup in Cloud Shell](https://img.shields.io/badge/Setup%20in%20Cloud%20Shell-blue?logo=googlecloud)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/tameson/gcloud-shell-ai-tools.git&cloudshell_tutorial=tutorial.md&show=ide&cloudshell_workspace=.)

[![Open existing Cloud Shell](https://img.shields.io/badge/Open%20existing%20Cloud%20Shell-green?logo=googlecloud)](https://shell.cloud.google.com/cloudshell/editor?show=ide&cloudshell_workspace=./cloudshell_open/gcloud-shell-ai-tools)



## Quick Start


1. Important things to check during setup
    - Make sure you have accepted the account invite for Anthropic Console
    - Allow popups in browser, so you are able to login via google account and to Anthropic Console
2. Click the button above for setup or open existing Cloud Shell
3. Follow the tutorial in Cloud Shell
4. Run `claude` to start

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
