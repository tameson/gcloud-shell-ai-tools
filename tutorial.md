# Claude Code Setup

<walkthrough-tutorial-duration duration="5"></walkthrough-tutorial-duration>

## Welcome

This tutorial will set up **Claude Code** as your Tameson Data Assistant.

**One-time setup:** Complete this tutorial once. Afterward, bookmark this link to reopen your workspace:  
`https://shell.cloud.google.com/cloudshell/editor?show=ide&cloudshell_workspace=./cloudshell_open/gcloud-shell-ai-tools`

Click **Start** to begin.

<walkthrough-footnote>Make sure you're logged into the correct Google account.</walkthrough-footnote>

## Step 1: Run Setup Script

You need to open a terminal first by going to 'terminal' in the menu bar and selecting 'new terminal'

Next copy the below command and paste it into the terminal and press enter. This will install Claude Code, configure BigQuery MCP server, and set up permissions (takes ~1 minute):

```bash
./setup.sh
```

Wait for the setup to complete successfully before proceeding.

<walkthrough-footnote>If you see authentication errors, run: `gcloud auth login`</walkthrough-footnote>

## Step 2: Start Claude Code

Next copy the below command and paste it into the terminal and press enter. This will launch Claude Code:

```bash
claude
```

**First-time setup:**
1. It will ask a few questions for preferences, accept all default options for text, permissions by pressing enter.
2. Select the option ```Anthropic Console account · API usage billing``` and login via your google account to Anthropic Console on the link provided, copy the code you receive.
3. Login via Google account at the provided link
4. Copy the authentication code back to terminal and press enter.

You should now see the Claude Code prompt and you can start asking questions in the next step.

## Step 3: Verify Setup

Test Claude Code with a sample question about our data, for example:

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
