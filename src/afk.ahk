global AFK := False

If (settings.other.afk_timer) {
	Loop {
		If (!WinActive("ahk_exe GTA5.exe")) {
			SetAfk()
		} Else {
			ResetAfk()
		}

		Sleep, 1000
	}
}

SetAfk() {
	If (!AFK) {
		AFK := True
		Time := 9.5 * 60 * 1000
		SetTimer, NotifyAfk, %Time%
	}

	Return
}

ResetAfk() {
	If (AFK) {
		AFK := False
		SetTimer, NotifyAfk, Delete
	}

	Return
}

NotifyAfk() {
	SetTimer, NotifyAfk, Delete
	Gui, Main:+OwnDialogs
	MsgBox,, %app_title%, Alert:`nYou have been AFK for 9 minutes and 30 seconds

	Return
}