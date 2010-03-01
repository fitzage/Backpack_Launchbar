on handle_string(theText)
	set apiKey to "YOUR_API_KEY"
	set yourUser to "YOUR_ACCOUNT_NAME"
	set backpackPage to "BACKPACK_PAGE_ID"
	set listID to "BACKPACK_LIST_ID"
	set SSL to "no"
	
	if SSL = "yes" then
		set identifier to "https://"
	else
		set identifier to "http://"
	end if
	
	set text item delimiters to ":"
	set theItems to text items of theText
	set text item delimiters to ""
	set itemCount to count of theItems
	if itemCount = 2 then
		set titleText to item 1 of theItems
		set bodyText to item 2 of theItems
		set CurlScript to "curl -H 'Content-Type: application/xml' -H 'X-BP-Token:" & apiKey & "' -d '<request><item><content>" & titleText & "</content></item></request>'  " & identifier & yourUser & ".backpackit.com/ws/page/" & backpackPage & "/lists/" & listID & "/items/add/"
		set CurlScript2 to "curl -H 'Content-Type: application/xml' -d '<request><token>" & apiKey & "</token><note><title>" & titleText & "</title><body>" & bodyText & "</body></note></request>' " & identifier & yourUser & ".backpackit.com/ws/page/" & backpackPage & "/notes/create"
	else
		set bodyText to theText
		set CurlScript to "curl -H 'Content-Type: application/xml' -H 'X-BP-Token:" & apiKey & "' -d '<request><item><content>" & bodyText & "</content></item></request>' " & identifier & yourUser & ".backpackit.com/ws/page/" & backpackPage & "/lists/" & listID & "/items/add/"
	end if
	
	do shell script CurlScript
	do shell script CurlScript2
	return null
	
end handle_string