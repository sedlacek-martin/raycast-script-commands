#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Dayflow Check
# @raycast.mode inline
# @raycast.refreshTime 5m

# Optional parameters:
# @raycast.icon 🌼

# Documentation:
# @raycast.author Martin Sedlacek
# @raycast.authorURL https://www.raycast.com/sedlacek-martin
# @raycast.description A background script to make sure Dayflow is running and recording your activity


tell application "Dayflow"
	-- Open "Dayflow" if not running
	if not it is running then
		activate
	end if

	-- Wait till application is really running 
	repeat
		if it is running then
			exit repeat
		else
			delay 0.1
		end if
	end repeat
end tell	


tell application "System Events"
    tell process "Dayflow"
    	--  Obtain the "Record" switch
        set theCheckbox to checkbox 1 of group 1 of window "Dayflow"

        -- If "Record" is turned off, click the swithc
        if not (theCheckbox's value as boolean) then
            click theCheckbox
        end if
    end tell
end tell

return "✔ Dayflow is running and recording..."