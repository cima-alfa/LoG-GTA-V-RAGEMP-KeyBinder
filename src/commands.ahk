Hotstring("EndChars", "`n ")

global commands := []

commands.Push({ cmd: "/att", format: "/att ID [ID ID ID...]", args: [1, -1], function: "process_cmd_wanteds_give", params: ["Attack", 10] })
commands.Push({ cmd: "/fl", format: "/fl ID [ID ID ID...]", args: [1, -1], function: "process_cmd_wanteds_give", params: ["Flucht", 6] })
commands.Push({ cmd: "/fb", format: "/fb ID [ID ID ID...]", args: [1, -1], function: "process_cmd_wanteds_give", params: ["Fluchtbeihilfe", 7] })
commands.Push({ cmd: "/cl", format: "/cl Reason ID [ID ID ID...]", args: [2, -1], function: "process_cmd_wanteds_clear" })
commands.Push({ cmd: "/ow", format: "/ow", args: [0, 0], function: "process_cmd_wanteds_show" })
commands.Push({ cmd: "/ge", format: "/ge ID [ID ID ID...]", args: [1, -1], function: "process_cmd_points_give", params: ["Geisterfahrt", 6] })

For index, command in settings.commands {
	If (command.cmd != "") {
		commands.push({ cmd: "/" command.cmd, format: "/" command.cmd, args: [0, 0], function: "process_cmd_custom", params: [command.text] })
	}
}

CommandCondition() {
	Return WinActive("ahk_exe GTA5.exe")
}

#If, CommandCondition()

Hotkey, If, CommandCondition()
Hotstring(":*?B0XZ:t", "ProcessCommand")

#If

ProcessCommand() {
	Suspend, Permit

	Input, Input, V I M, {Enter}

	If (Input = "" || !RegExMatch(Input, "^/")) {
		Hotstring("Reset")

		Return
	}

	For index, command in commands {
		format := command.format

		If (Input = command.cmd && command.args[1] != 0) {
			If (ProcessHotkeyActive || !KeybinderOn) {
				SendInput, {End}+{Home}{Del}{Enter}

				Break
			}

			SendInput, {End}+{Home}{Del}{Raw}Usage: %format%

			Break
		} Else {
			regex := % "^" command.cmd " "

			If (Input = command.cmd) {
				regex := % "^" command.cmd
			}

			is_cmd := RegExMatch(Input, regex, trim)

			If (is_cmd) {
				If (ProcessHotkeyActive || !KeybinderOn) {
					SendInput, {End}+{Home}{Del}{Enter}

					Break
				}

				StringTrimLeft, Input, Input, StrLen(trim)

				Args := process_cmd_get_args(command, Input)

				If (Args) {
					SendInput, {End}+{Home}{Del}{Enter}

					function := command.function

					ProcessHotkeyActive := True

					If (command.params) {
						%function%(command.params, Args)
					} Else {
						%function%(Args)
					}

					Sleep, 300
	
					ProcessHotkeyActive := False
				}

				Break
			}
		}
	}

	Hotstring("Reset")

	Return
}

process_cmd_get_args(data, Args) {
	Pos := 1
	Count := 0
	Args_arr := []

	While, Pos := RegExMatch(Args, "[a-zA-Z0-9._\[\]]+", Arg, Pos + StrLen(Arg)) {
		Count++
		Args_arr.Push(Arg)
	}

	If (Count < data.args[1] || (Count > data.args[2] && data.args[2] != -1)) {
		format := data.format

		SendInput, t{End}+{Home}{Del}{Raw}Usage: %format%

		Return False
	}

	Return Args_arr
}

process_cmd_wanteds_give(params, Args) {
	Reason := params[1]
	Amount := params[2]

	For Key, Arg in Args {
		Sleep, 300

		If (LoopStop) {
			Break
		}

		SendInput, t{End}+{Home}{Del}{Raw}/wa %Arg% %Amount% %Reason%
		SendInput, {Enter}
	}

	LoopStop := False

	Return
}

process_cmd_wanteds_clear(Args) {
	Reason := Args.RemoveAt(1)

	For Key, Arg in Args {
		Sleep, 300

		If (LoopStop) {
			Break
		}

		SendInput, t{End}+{Home}{Del}{Raw}/clear %Arg% %Reason%
		SendInput, {Enter}
	}

	LoopStop := False

	Return
}

process_cmd_wanteds_show(Args) {
	right := settings.other.navright
	down := settings.other.navdown

	Sleep, 350

	If (LoopStop) {
		LoopStop := False

		Return
	}

	Send, {%right%}
	Sleep, 350
	Send, {%down%}{%down%}{Enter}

	Return
}

process_cmd_points_give(params, Args) {
	Reason := params[1]
	Amount := params[2]
	right := settings.other.navright
	down := settings.other.navdown

	For Key, Arg in Args {
		Sleep, 350

		If (LoopStop) {
			Break
		}

		Send, {%right%}
		Sleep, 350
		Send, {%down%}{Enter}
		Sleep, 350
		SendInput, {End}+{Home}{Del}{Raw}%Arg%
		Sleep, 100
		SendInput, {Enter} 
		Sleep, 350
		SendInput, {End}+{Home}{Del}{Raw}%Amount%
		Sleep, 100
		SendInput, {Enter}
		Sleep, 350
		SendInput, {End}+{Home}{Del}{Raw}%Reason%
		Sleep, 100
		SendInput, {Enter}
	}

	LoopStop := False

	Return
}

process_cmd_custom(params, Args) {
	text := params[1]

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

			If (index != 1) {
				SendInput, {Enter}
			}

			index++
		}
	}

	LoopStop := False

	Return
}