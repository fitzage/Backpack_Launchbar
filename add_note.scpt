on handle_string(theText)
	set apiKey to "YOUR_API_KEY"
	set yourUser to "YOUR_ACCOUNT_NAME"
	set backpackPage to "BACKPACK_PAGE_ID"
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
		set CurlScript to "curl -H 'Content-Type: application/xml' -d '<request><token>" & apiKey & "</token><note><title>" & titleText & "</title><body>" & bodyText & "</body></note></request>' " & identifier & yourUser & ".backpackit.com/ws/page/" & backpackPage & "/notes/create"
	else
		set bodyText to theText
		set CurlScript to "curl -H 'Content-Type: application/xml' -d '<request><token>" & apiKey & "</token><note><title></title><body>" & bodyText & "</body></note></request>' " & identifier & yourUser & ".backpackit.com/ws/page/" & backpackPage & "/notes/create"
	end if
	
	do shell script CurlScript
	return null
	
end handle_string