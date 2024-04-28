global ProcessHotkeyActive := False
global KeybinderOn := True
global LoopStop := False

HotkeyConditionDefault() {
	Return (WinActive("ahk_exe GTA5.exe") && !ProcessHotkeyActive && KeybinderOn)
}

HotkeyConditionSettings() {
	Return (WinActive("ahk_exe GTA5.exe") && KeybinderOn)
}

HotkeyConditionToggle() {
	Return WinActive("ahk_exe GTA5.exe")
}

For keybind_type, keybind_data in settings.keybinds {
	For index, keybind in keybind_data {
		If (keybind.hotkey != "" && keybind_type != "settings") {
			#If, HotkeyConditionDefault()
			Hotkey, If, HotkeyConditionDefault()
			Hotkey, % keybind.hotkey, ProcessHotkey
		} Else If (keybind.hotkey != "" && keybind_type = "settings" && index != "togglekeybinder") {
			#If, HotkeyConditionSettings()
			Hotkey, If, HotkeyConditionSettings()
			Hotkey, % keybind.hotkey, ProcessHotkey
		} Else If (keybind.hotkey != "" && index = "togglekeybinder") {
			#If, HotkeyConditionToggle()
			Hotkey, If, HotkeyConditionToggle()
			Hotkey, % keybind.hotkey, ProcessHotkey
		}
	}
}

#If

ProcessHotkey() {
	For keybind_type, keybind_data in settings.keybinds {
		For index, keybind in keybind_data {
			If (keybind.hotkey = A_ThisHotkey) {
				function := % "process_hotkey_" keybind_type

				Break 2
			}
		}
	}

	ProcessHotkeyActive := True

	%function%(index, keybind)

	Sleep, 300
	
	ProcessHotkeyActive := False
	
	Return
}

process_hotkey_loops(index, keybind) {
	iterations := keybind.iterations
	text := keybind.text
	pause := keybind.pause * 1000
	reverse := keybind.reverse
	intro := keybind.intro	
	outro := keybind.outro

	For what, with in variables {
		text := StrReplace(text, what, with)
		intro := StrReplace(intro, what, with)
		outro := StrReplace(outro, what, with)
	}

	intro := StrReplace(intro, "%N%", iterations)

	If (intro != "") {
		SendInput, t{End}+{Home}{Del}{Raw}%intro%
		SendInput, {Enter}
	}

	Loop, % iterations {
		If (!reverse) {
			c_text := StrReplace(text, "%N%", A_Index)
		} Else {
			c_text := StrReplace(text, "%N%", iterations)
		}

		If (intro != "" || (A_Index != 1 && intro = "")) {
			Sleep, %pause%
		}

		If (LoopStop) {
			Break
		}

		SendInput, t{End}+{Home}{Del}{Raw}%c_text%
		SendInput, {Enter}

		If (reverse) {
			iterations := iterations - 1
		}
	}

	If (LoopStop) {
		LoopStop := False

		Return
	}

	outro := StrReplace(outro, "%N%", iterations)

	If (outro != "") {
		Sleep, %pause%
		SendInput, t{End}+{Home}{Del}{Raw}%outro%
		SendInput, {Enter}
	}

	Sleep, 300

	Return
}

process_hotkey_texts(index, keybind) {
	text := keybind.text

	For what, with in variables {
		text := StrReplace(text, what, with)
	}

	text := StrReplace(text, "\n", "¢")
	index := 1

	Loop, parse, text, ¢
	{
		If (Trim(A_LoopField) != "") {
			If (index != 1) {
				Sleep, 300
			}

			If (LoopStop) {
				Break
			}

			SendInput, t{End}+{Home}{Del}{Raw}%A_LoopField%
			SendInput, {Enter}

			index++
		}
	}

	LoopStop := False

	Return
}

process_hotkey_heal(index, keybind) {
	heal_player(index)

	Return
}

process_hotkey_settings(index, keybind) {
	If (index = "togglekeybinder") {
		If (KeybinderOn) {
			KeybinderOn := False
			LoopStop := True

			SendInput, t{End}+{Home}{Del}Keybinder Off{Enter}
		} Else {
			KeybinderOn := True
			LoopStop := False
			
			SendInput, t{End}+{Home}{Del}Keybinder On{Enter}
		}
	}

	If (index = "cancelloop") {
		LoopStop := True
	}

	Return
}