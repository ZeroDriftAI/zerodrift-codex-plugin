#!/bin/sh
# Hook templates need every field they read, so `subject` must be present to check it with the body.
input=$(cat)
case "$input" in
  *'"subject":'*) ;;
  *)
    printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"ZeroDrift checks the subject and body together. Retry with a subject field; an empty string keeps the message without a subject."}}'
    ;;
esac
