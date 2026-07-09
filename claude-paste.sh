#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Paste Clean
# @raycast.mode silent
# @raycast.packageName Clipboard
# @raycast.icon 🧹

# 1. Strip leading whitespace from every line
# 2. Collapse 3+ newlines into a single blank line
# 3. Put it back on the clipboard, then paste
pbpaste \
  | sed -E 's/^[[:space:]]+//' \
  | awk 'BEGIN{RS="";ORS="\n\n"}{print}' \
  | pbcopy

osascript -e 'tell application "System Events" to keystroke "v" using command down'