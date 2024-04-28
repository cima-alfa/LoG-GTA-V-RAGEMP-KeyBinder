IfExist, keybinder_update.bat
	FileDelete, keybinder_update.bat

If (settings.other.auto_update) {
	; UpdateKeybinder()
}

If (settings.other.patch_notes) {
	; PatchNotes()
}

UpdateKeybinder() {
	If (A_IsCompiled) {
		If (version_new > version) {
			download_update := False

			MsgBox, 4, %app_title%, New version is available!`nDownload now?
			IfMsgBox, Yes
				download_update := True

			If (download_update) {
				settings.other.patch_notes := True
				settings := JSON.Dump(settings)

				FileDelete, keybinder_settings.json
				FileAppend, %settings%, keybinder_settings.json

				Gui, Update:New, -Resize -MaximizeBox, %app_title%
				Gui, Update:Font, q2 s10
				Gui, Update:Add, Text,, Downloading update...
				Gui, Update:Show, Center AutoSize

				UrlDownloadToFile, %download_url%, %A_ScriptName%.new

				update_bat =
				(
					Ping 127.0.0.1
					Del "%A_ScriptName%"
					Rename "%A_ScriptName%.new" "%A_ScriptName%"
					"%A_ScriptName%"
				)

				FileAppend, %update_bat%, keybinder_update.bat
				Run, keybinder_update.bat,, Hide

				ExitApp
			}
		}
	}

	Return
}

UpdateGuiClose() {
	Gui, Update:Show, Center AutoSize

	Return
}

; Patch notes fn placeholder (server for downloads no longer works)
PatchNotes() {
	Return
}

PatchNotesFn() {
	oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	oWhr.Open("GET", update_url, False)
	oWhr.SetRequestHeader("Content-Type", "application/json")
	oWhr.Send()

	data := JSON.Load(oWhr.ResponseText)

	Gui, Patch:New, -Resize -MaximizeBox, %app_title%
	Gui, Patch:Font, q2 s12 Bold
	Gui, Patch:Add, Text, w600 Section, % "Patch Notes v" data.version
	Gui, Patch:Font, s10 Bold
	Gui, Patch:Add, Text, w600 y+20, Changes
	Gui, Patch:Font, s9 Normal

	For index, value in data.patch_notes {
		Gui, Patch:Add, Text, w10 xs y+10, % Chr(0x02022)
		
		list := StrSplit(value, "`n`t")

		Gui, Patch:Add, Text, w600 xp+10, % list.RemoveAt(1)

		For index, line in list {
			Gui, Patch:Add, Text, w10 xs+20 y+10, % Chr(0x02022)
			Gui, Patch:Add, Text, w580 x+0, % line
		}
	}

	Gui, Patch:Font, s10 Bold
	Gui, Patch:Add, Text, w600 xs y+20, To-Do List
	Gui, Patch:Font, s9 Normal

	For index, value in data.todo {
		Gui, Patch:Add, Text, w10 xs y+10, % Chr(0x02022)
		
		list := StrSplit(value, "`n`t")

		Gui, Patch:Add, Text, w600 xp+10, % list.RemoveAt(1)

		For index, line in list {
			Gui, Patch:Add, Text, w10 xs+20 y+10, % Chr(0x02022)
			Gui, Patch:Add, Text, w580 x+0, % line
		}
	}

	Gui, Patch:Add, Button, xs y+30 w150 gPatchGuiClose, Close

	Gui, Patch:Show, Center AutoSize

	If (settings.other.patch_notes) {
		Pause, On
	} Else {
		Gui, Patch:+OwnerMain
	}

	Return
}

PatchGuiClose() {
	Gui, Patch:Destroy

	If (settings.other.patch_notes) {
		settings.other.patch_notes := False
		settings := JSON.Dump(settings)

		FileDelete, keybinder_settings.json
		FileAppend, %settings%, keybinder_settings.json

		Reload
	}

	Return
}