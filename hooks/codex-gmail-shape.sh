#!/bin/sh
# Hook templates read only plain string fields, so the body must be in payload.body.content.
# Codex sends compact JSON: a key reads `"name":`, while a quote inside a string value is escaped.
input=$(cat)
case "$input" in
  *'"parts":'* | *'"base64_url_content":'*)
    printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"ZeroDrift can only check a plain-text body. Retry with the message text in payload.body.content (no parts, no base64)."}}'
    ;;
esac
