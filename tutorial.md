# Claude Code Setup

<walkthrough-tutorial-duration duration="5"></walkthrough-tutorial-duration>

## Welcome

This tutorial will set up **Claude Code** as your Tameson Data Assistant.

Click **Start** to begin.

## Step 1: Run Setup

First open a terminal ```shift+ctrl+c```

Run the setup script in the terminal below:

```bash
./setup.sh
```

This will:
- Install Claude Code
- Configure MCP servers (BigQuery, Product Search, Context7, Markitdown)
- Set up permissions for filesystem and tools

Wait for it to complete (about 1 minute).

<walkthrough-footnote>If you see permission errors, make sure you're logged into the correct Google account.</walkthrough-footnote>


## Step 2: Start Claude Code

Start Claude Code:

```bash
claude
```

On first run, you'll be prompted to login via your account or API key

Select the API key based cost and login via your google account on the link provided, copy the code you receive.

## Step 5: Verify Setup

Once Claude Code starts, try asking:

```
Is the currency rate USD/EUR available in BigQuery for last week, how much did it change?
```

Claude should try to find it in bigquery.

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

## You're Ready!

Claude Code is now configured with:
- **BigQuery** - Query the Tameson datalake
- **Product Search** - Find products and categories in the tameson catalog
- **Context7** - IT docs and Library documentation
- **Markitdown** - Document and pdf reading

**Happy researching!**
