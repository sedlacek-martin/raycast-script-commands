#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Dayflow
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌸
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description Toggle capture
# @raycast.author michael_bartl
# @raycast.authorURL https://raycast.com/michael_bartl

tell application "System Events"
	tell application process "Dayflow"
		click menu bar item 1 of menu bar 2
		click UI element 1 of group 1 of UI element 1 of menu bar item 1 of menu bar 2
		key code 53 -- press escape
	end tell
end tell

log "Toggled capture"

