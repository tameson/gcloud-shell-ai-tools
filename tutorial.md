# Claude Code Setup

<walkthrough-tutorial-duration duration="5"></walkthrough-tutorial-duration>

## Welcome

This tutorial will set up **Claude Code** as your Tameson Data Assistant.

**One-time setup:** Complete this tutorial once. Afterward, bookmark this link to reopen your workspace:  
`https://shell.cloud.google.com/cloudshell/editor?show=ide&cloudshell_workspace=./cloudshell_open/gcloud-shell-ai-tools`

Click **Start** to begin.

<walkthrough-footnote>Make sure you're logged into the correct Google account.</walkthrough-footnote>

## Step 1: Run Setup Script

You need to open a terminal first by pressing ```ctrl+shift+c```

Next copy the below command and paste it into the terminal and press enter. This will install Claude Code, configure BigQuery MCP server, and set up permissions (takes ~1 minute):

```bash
./setup.sh
```

Wait for the setup to complete successfully before proceeding.

<walkthrough-footnote>If you see authentication errors, run: `gcloud auth login`</walkthrough-footnote>

## Step 2: Start Claude Code

Launch Claude Code:

```bash
claude
```

**First-time setup:**
1. Choose `Anthropic Console account · API usage billing`
2. Login via Google account at the provided link
3. Copy the authentication code back to terminal
4. Accept all default options

## Step 3: Verify Setup

Test Claude Code with this query:

```
which product level 2 categories often have products that sustain a high pressure over 20 bar?
```

Claude will query BigQuery, analyze the data, and save a report with findings to `/outputs`.

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

## You're Ready!

**Claude Code is now configured with BigQuery access to the Tameson datalake.**

**Useful commands:**
- `/mcp` - List available MCP servers and commands
- `/clear` - Clear console and start fresh
- `Ctrl+C` - Stop current command/return to terminal
- Use markdown preview to view reports in readable format

Don't forget to bookmark the link to reopen your workspace:  
`https://shell.cloud.google.com/cloudshell/editor?show=ide&cloudshell_workspace=./cloudshell_open/gcloud-shell-ai-tools`

**Happy researching!**
