# Claude Code Setup

<walkthrough-tutorial-duration duration="5"></walkthrough-tutorial-duration>

## Welcome

This tutorial will set up **Claude Code** as your Tameson Data Assistant.

Click **Start** to begin.

## Step 1: Run Setup

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

## Step 2: Verify Google Cloud Auth

Make sure you're authenticated with Google Cloud:

```bash
gcloud auth list
```

You should see your account with an asterisk (*) next to it.

If not authenticated, run:
```bash
gcloud auth login
```

## Step 3: Get Your Anthropic API Key

You need an Anthropic API key to use Claude Code.

1. Go to [console.anthropic.com/settings/keys](https://console.anthropic.com/settings/keys)
2. Create a new API key or copy an existing one
3. Keep it ready for the next step

## Step 4: Start Claude Code

Start Claude Code:

```bash
claude
```

On first run, you'll be prompted to enter your API key.

Paste your Anthropic API key when asked.

## Step 5: Verify Setup

Once Claude Code starts, try asking:

```
What datasets are available in BigQuery?
```

Claude should list the available datasets from the Tameson datalake.

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

## You're Ready!

Claude Code is now configured with:
- **BigQuery** - Query the Tameson datalake
- **Product Search** - Find products in the catalog
- **Context7** - Library documentation
- **Markitdown** - Document conversion

**Happy researching!**
