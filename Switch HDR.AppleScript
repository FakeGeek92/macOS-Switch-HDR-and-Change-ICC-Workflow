
if application "System Preferences" is running then
	tell application "System Preferences" to quit
end if

tell application "System Preferences"
	set the current pane to pane id "com.apple.preference.displays"
	activate
end tell

tell application "System Events" to tell process "System Preferences"
	repeat until button "Display Settings…" of window "Displays" exists
	end repeat
	
	click button "Display Settings…" of window "Displays"
	
	repeat until checkbox "High Dynamic Range, Automatically adjust the display to show high dynamic range content." of sheet 1 of window "Displays" exists
	end repeat
	
	set theCheckbox to checkbox "High Dynamic Range, Automatically adjust the display to show high dynamic range content." of sheet 1 of window "Displays"
	tell theCheckbox
		if not (its value as boolean) then
			set hdrstate to "hdroff"
		else
			set hdrstate to "hdron"
		end if
	click theCheckbox
	end tell
	
	delay 1
	
	click button "Done" of sheet 1 of window "Displays"
end tell

delay 1

if application "System Preferences" is running then
	tell application "System Preferences" to quit
end if

return hdrstate