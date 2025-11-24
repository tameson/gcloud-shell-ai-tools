# Claude Code Setup

<walkthrough-tutorial-duration duration="3"></walkthrough-tutorial-duration>

## Welcome

This tutorial will set up **Claude Code** with pre-configured tools for our team.

Click **Start** to begin.

## Step 1: Run Setup

Run the setup script in the terminal below:

```bash
./setup.sh
```

This will:
- Install Claude Code
- Configure MCP servers (BigQuery, Context7, Markitdown)
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

## Step 3: Start Claude Code

Now start Claude Code:

```bash
claude
```

That's it! Claude Code is now ready with:
- **BigQuery** access for data analysis
- **Context7** for library documentation
- **Markitdown** for document conversion

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

## Tips

- Type `/help` in Claude Code to see available commands
- Use `claude --help` for CLI options
- MCP servers are pre-configured and ready to use

**Happy coding!**
