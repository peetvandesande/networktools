REM  *****  BASIC  *****

function IsisNet(ByVal NetID as String, ByVal SysID as String) As String
	' Take the Net.ID and Sys.ID (ip address)
	' And combine them into the isis net
	' Assuming NetID is formatted like "49.0001"
	'   and SysID is formatted like an IP address ("1.1.1.1")
	Dim pos as Integer
	Dim PaddedIP as String
	SysID = SysID + "."
	PaddedIP = ""
	While SysID <> ""
		pos = InStr(SysID, ".")
		PaddedIP = PaddedIP + Format((Left(SysID, pos -1)), "000")
		SysID = Mid(SysID, pos + 1)
	Wend
	IsisNet = NetID + "." + Left(PaddedIP, 4) + "." + Mid(PaddedIP, 5, 4) + "." + Right(PaddedIP, 4)  + ".00"
end function
