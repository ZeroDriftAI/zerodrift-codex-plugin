# ZeroDrift for Codex

Checks drafts Codex writes against your company policies. Each check returns the outcome and next step, then each flagged line with a short quote and the rules it breaks (severity and policy), and the `job_id` to find the check in Activity.

ZeroDrift validates only; it never rewrites your text. Results also appear in the Activity feed in ZeroDrift Command.

## What gets checked

- **Before sending:** Gmail send, draft, draft update and forward actions. A `Blocked` message is stopped; `Warned` and `Passed` go through. The body must be plain text: Codex is asked to resend a multipart or base64 body as plain text before the check runs. Attachments, the original message of a forward, and saved drafts sent as-is are not checked.
- **Any draft on request**, by asking Codex to check it with ZeroDrift.

## Setup

1. Add the marketplace and install:

   ```
   codex plugin marketplace add ZeroDriftAI/zerodrift-codex-plugin
   codex plugin add zerodrift@zerodrift
   ```

2. Sign in to ZeroDrift in the browser and approve access for your workspace:

   ```
   codex mcp login zerodrift
   ```

3. In Codex, run `/hooks` and trust the ZeroDrift hooks. Codex asks again when an update changes them.

To sign out, run `codex mcp logout zerodrift`.

## Data sent

- **What:** the text being checked (subject and body for Gmail actions). Recipients and attachments are not sent.
- **Where:** `https://mcp.zerodrift.ai`, over HTTPS, authenticated with your ZeroDrift sign-in. ZeroDrift records each check under your user and workspace.
- **Retention:** ZeroDrift keeps submitted text for seven days by default, per your ZeroDrift agreement.

If a message can't be checked (not signed in, service unreachable, hooks not trusted, or validation unavailable), Codex lets the message go through.

## Where it runs

The Codex CLI and the Codex desktop app. Hooks run only after you trust them.

## Support

[support@zerodrift.ai](mailto:support@zerodrift.ai)
[https://zerodrift.com](https://zerodrift.com)
