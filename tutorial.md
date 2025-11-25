# Claude Code Setup

<walkthrough-tutorial-duration duration="5"></walkthrough-tutorial-duration>

## Welcome

This tutorial will set up **Claude Code** as your Tameson Data Assistant.

You only have to do this once! After you have finished setup, the next time you can just go to 
[![Open existing Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?show=ide&cloudshell_workspace=./cloudshell_open/gcloud-shell-ai-tools)

**Please bookmark above link as you will need it to open the cloud shell again in the future.**

Click **Start** to begin.

This will:
- Install Claude Code
- Configure MCP servers (BigQuery)
- Set up permissions for filesystem and tools

Wait for it to complete (about 1 minute).

<walkthrough-footnote>If you see permission errors, make sure you're logged into the correct Google account.</walkthrough-footnote>


## Step 2: Start Claude Code

Start Claude Code and setup:

```bash
claude
```

On first run, you'll be prompted to login via your account or API key

Select the option ```Anthropic Console account · API usage billing``` and login via your google account to Anthropic Console on the link provided, copy the code you receive.

Accept step by step all other default options for setting up your Claude Code account.

## Step 3: Verify Setup

Once Claude Code starts, try asking:

```
which product level 2 categories often have products that sustain a high pressure over 20 bar?
```

Claude should try to find it in bigquery, analyze the data and provide a small report with the used query and the findings in /outputs folder.

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

## You're Ready!

Claude Code is now configured with:
- **BigQuery** - Query the Tameson datalake

Some tips and tricks in claude code:
- use /mcp commands to list the available MCP servers and their commands 
- use /clear to clear the console and start fresh
- use ctrl+c to stop any command or claude so you get back to the terminal
- use markdown preview option to see the output report in a nice readable format

**Happy researching!**
