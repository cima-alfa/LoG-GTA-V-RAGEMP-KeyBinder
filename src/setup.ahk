global ProcessHotkeyActive := False
global KeybinderOn := True
global LoopStop := False

global keybinds_texts := 20
global keybinds_loops := 6
global custom_commands := 20
global custom_variables := 20

global defaults := []

keybinds := []

keybinds["texts"] := []

Loop, %keybinds_texts% {
	index := A_Index - 1

	keybinds["texts"][index] := []
	keybinds["texts"][index]["hotkey"] := ""
	keybinds["texts"][index]["text"] := ""
}

keybinds["loops"] := []

Loop, %keybinds_loops% {
	index := A_Index - 1

	keybinds["loops"][index] := []
	keybinds["loops"][index]["hotkey"] := ""
	keybinds["loops"][index]["text"] := "%N%"
	keybinds["loops"][index]["iterations"] := "5"
	keybinds["loops"][index]["pause"] := "1"
	keybinds["loops"][index]["reverse"] := "1"
	keybinds["loops"][index]["intro"] := ""
	keybinds["loops"][index]["outro"] := ""
}

keybinds["heal"] := []
keybinds["heal"]["doener"] := []
keybinds["heal"]["doener"]["hotkey"] := ""
keybinds["heal"]["baklava"] := []
keybinds["heal"]["baklava"]["hotkey"] := ""
keybinds["heal"]["cheeseburger"] := []
keybinds["heal"]["cheeseburger"]["hotkey"] := ""
keybinds["heal"]["apfel"] := []
keybinds["heal"]["apfel"]["hotkey"] := ""
keybinds["heal"]["chips"] := []
keybinds["heal"]["chips"]["hotkey"] := ""

keybinds["settings"] := []

keybinds["settings"]["togglekeybinder"] := []
keybinds["settings"]["togglekeybinder"]["hotkey"] := "!="
keybinds["settings"]["cancelloop"] := []
keybinds["settings"]["cancelloop"]["hotkey"] := "!-"

defaults["keybinds"] := keybinds

commands := []

Loop, %custom_commands% {
	index := A_Index - 1

	commands[index] := []
	commands[index]["cmd"] := ""
	commands[index]["text"] := ""
}

defaults["commands"] := commands

variables := []

Loop, %custom_variables% {
	index := A_Index - 1

	variables[index] := []
	variables[index]["var"] := ""
	variables[index]["text"] := ""
}

defaults["variables"] := variables

player := []

player["name"] := ""
player["faction"] := ""
player["rank"] := ""

defaults["player"] := player

other := []
other["navup"] := "Up"
other["navdown"] := "Down"
other["navleft"] := "Left"
other["navright"] := "Right"
other["auto_update"] := True
other["patch_notes"] := True
other["resolution"] := ""
other["afk_timer"] := True

defaults["other"] := other

If (!FileExist("keybinder_settings.json")) {
	settings := JSON.Dump(defaults)

	FileAppend, %settings%, keybinder_settings.json
}

FileRead, settings, keybinder_settings.json

global settings := JSON.Load(settings)
global variables := { "%NAME%": settings.player.name, "%FACTION%": settings.player.faction, "%RANK%": settings.player.rank }

For index, variable in settings.variables {
	If (variable.var != "") {
		variables.Insert("%" variable.var "%", variable.text)
	}
}

For variable, variable_text in variables {
	For what, with in variables {
		variable_text := StrReplace(variable_text, what, with)
	}

	variables[variable] := variable_text
}

CheckSettings()

CheckSettings() {
	Differences := CheckMissingSettings()
	Differences := CheckExcessSettings(Differences)

	If (Differences) {
		settings := JSON.Dump(settings)

		FileDelete, keybinder_settings.json
		FileAppend, %settings%, keybinder_settings.json

		Reload
	}

	Return
}

CheckMissingSettings() {
	Differences := False

	For Key, Value in defaults {
		If (!settings.HasKey(Key)) {
			Differences := True
			settings[Key] := Value
		}
	}

	For Key, Value in defaults["keybinds"] {
		If (!settings.keybinds.HasKey(Key)) {
			Differences := True
			settings["keybinds"][Key] := Value
		}
	}

	For Key, Value in defaults["keybinds"]["texts"] {
		If (!settings.keybinds.texts.HasKey(Key)) {
			Differences := True
			settings["keybinds"]["texts"][Key] := Value
		}
	}

	For Key, Value in defaults["keybinds"]["loops"] {
		If (!settings.keybinds.loops.HasKey(Key)) {
			Differences := True
			settings["keybinds"]["loops"][Key] := Value
		}
	}

	For Key, Value in defaults["keybinds"]["heal"] {
		If (!settings.keybinds.heal.HasKey(Key)) {
			Differences := True
			settings["keybinds"]["heal"][Key] := Value
		}
	}

	For Key, Value in defaults["keybinds"]["settings"] {
		If (!settings.keybinds.settings.HasKey(Key)) {
			Differences := True
			settings["keybinds"]["settings"][Key] := Value
		}
	}

	For Key, Value in defaults["commands"] {
		If (!settings.commands.HasKey(Key)) {
			Differences := True
			settings["commands"][Key] := Value
		}
	}

	For Key, Value in defaults["variables"] {
		If (!settings.variables.HasKey(Key)) {
			Differences := True
			settings["variables"][Key] := Value
		}
	}

	For Key, Value in defaults["player"] {
		If (!settings.player.HasKey(Key)) {
			Differences := True
			settings["player"][Key] := Value
		}
	}

	For Key, Value in defaults["other"] {
		If (!settings.other.HasKey(Key)) {
			Differences := True
			settings["other"][Key] := Value
		}
	}

	Return Differences
}

CheckExcessSettings(Differences) {
	For Key, Value in settings {
		If (!defaults.HasKey(Key)) {
			Differences := True
			settings.Remove(Key)
		}
	}

	For Key, Value in settings.keybinds {
		If (!defaults.keybinds.HasKey(Key)) {
			Differences := True
			settings.keybinds.Remove(Key)
		}
	}

	For Key, Value in settings.keybinds.texts {
		If (!defaults.keybinds.texts.HasKey(Key)) {
			Differences := True
			settings.keybinds.texts.Remove(Key)
		}
	}

	For Key, Value in settings.keybinds.loops {
		If (!defaults.keybinds.loops.HasKey(Key)) {
			Differences := True
			settings.keybinds.loops.Remove(Key)
		}
	}

	For Key, Value in settings.keybinds.heal {
		If (!defaults.keybinds.heal.HasKey(Key)) {
			Differences := True
			settings.keybinds.heal.Remove(Key)
		}
	}

	For Key, Value in settings.keybinds.settings {
		If (!defaults.keybinds.settings.HasKey(Key)) {
			Differences := True
			settings.keybinds.settings.Remove(Key)
		}
	}

	For Key, Value in settings.commands {
		If (!defaults.commands.HasKey(Key)) {
			Differences := True
			settings.commands.Remove(Key)
		}
	}

	For Key, Value in settings.variables {
		If (!defaults.variables.HasKey(Key)) {
			Differences := True
			settings.variables.Remove(Key)
		}
	}

	For Key, Value in settings.player {
		If (!defaults.player.HasKey(Key)) {
			Differences := True
			settings.player.Remove(Key)
		}
	}

	For Key, Value in settings.other {
		If (!defaults.other.HasKey(Key)) {
			Differences := True
			settings.other.Remove(Key)
		}
	}

	Return Differences
}

SaveSettings() {
	Loop, %keybinds_texts% {
		index := A_Index - 1

		GuiControlGet, hotkey,, KeybindsTextsHotkey%index%
		GuiControlGet, text,, KeybindsTextsText%index%

		settings.keybinds.texts[index].hotkey := hotkey
		settings.keybinds.texts[index].text := Trim(text)
	}

	Loop, %keybinds_loops% {
		index := A_Index - 1

		GuiControlGet, hotkey,, KeybindsLoopsHotkey%index%
		GuiControlGet, text,, KeybindsLoopsText%index%
		GuiControlGet, iterations,, KeybindsLoopsIterations%index%
		GuiControlGet, pause,, KeybindsLoopsPause%index%
		GuiControlGet, reverse,, KeybindsLoopsReverse%index%
		GuiControlGet, intro,, KeybindsLoopsIntro%index%
		GuiControlGet, outro,, KeybindsLoopsOutro%index%

		data := CheckLoop(iterations, pause)
		iterations := data["iterations"]
		pause := data["pause"]

		settings.keybinds.loops[index].hotkey := hotkey
		settings.keybinds.loops[index].text := Trim(text)
		settings.keybinds.loops[index].iterations := Trim(iterations)
		settings.keybinds.loops[index].pause := Trim(pause)
		settings.keybinds.loops[index].reverse := reverse
		settings.keybinds.loops[index].intro := Trim(intro)
		settings.keybinds.loops[index].outro := Trim(outro)
	}

	GuiControlGet, hotkey,, KeybindsHealDoener
	settings.keybinds.heal.doener.hotkey := hotkey

	GuiControlGet, hotkey,, KeybindsHealBaklava
	settings.keybinds.heal.baklava.hotkey := hotkey

	GuiControlGet, hotkey,, KeybindsHealCheeseburger
	settings.keybinds.heal.cheeseburger.hotkey := hotkey

	GuiControlGet, hotkey,, KeybindsHealApple
	settings.keybinds.heal.apfel.hotkey := hotkey

	GuiControlGet, hotkey,, KeybindsHealChips
	settings.keybinds.heal.chips.hotkey := hotkey

	GuiControlGet, hotkey,, KeybindsSettingsToggleKeybinder
	settings.keybinds.settings.togglekeybinder.hotkey := hotkey

	GuiControlGet, hotkey,, KeybindsSettingsCancelLoop
	settings.keybinds.settings.cancelloop.hotkey := hotkey

	Loop, %custom_commands% {
		index := A_Index - 1

		GuiControlGet, cmd,, CommandsCmd%index%
		GuiControlGet, text,, CommandsText%index%

		cmd := CheckCommand(cmd)

		settings.commands[index].cmd := Trim(cmd)
		settings.commands[index].text := Trim(text)
	}

	Loop, %custom_variables% {
		index := A_Index - 1

		GuiControlGet, var,, VariablesVar%index%
		GuiControlGet, text,, VariablesText%index%

		var := CheckVariable(var)

		settings.variables[index].var := Trim(var)
		settings.variables[index].text := Trim(text)
	}

	GuiControlGet, value,, PlayerName
	settings.player.name := Trim(value)

	GuiControlGet, value,, PlayerFaction
	settings.player.faction := Trim(value)

	GuiControlGet, value,, PlayerRank
	settings.player.rank := Trim(value)

	GuiControlGet, hotkey,, OtherNavUp
	settings.other.navup := hotkey

	GuiControlGet, hotkey,, OtherNavDown
	settings.other.navdown := hotkey

	GuiControlGet, hotkey,, OtherNavLeft
	settings.other.navleft := hotkey

	GuiControlGet, hotkey,, OtherNavRight
	settings.other.navright := hotkey

	GuiControlGet, hotkey,, OtherResolution
	settings.other.resolution := hotkey

	GuiControlGet, value,, OtherAfkTimer
	settings.other.afk_timer := value

	settings := JSON.Dump(settings)

	FileDelete, keybinder_settings.json
	FileAppend, %settings%, keybinder_settings.json

	Reload

	Return
}

CheckLoop(iterations, pause) {
	If iterations is not Integer
		iterations := defaults["keybinds"]["loops"][0]["iterations"]

	If pause is not Float
		If pause is not Integer
			pause := defaults["keybinds"]["loops"][0]["pause"]

	If (iterations < 0 || iterations > 10)
		iterations := defaults["keybinds"]["loops"][0]["iterations"]

	If (pause < 0.5 || pause > 3)
		pause := defaults["keybinds"]["loops"][0]["pause"]

	data := []
	data["iterations"] := iterations
	data["pause"] := pause

	Return data
}

CheckCommand(cmd) {
	StringLower, cmd, cmd
	RegExMatch(cmd, "[a-z0-9]+", cmd)

	Return cmd
}

CheckVariable(var) {
	StringUpper, var, var
	RegExMatch(var, "[A-Z0-9]+", var)

	Return var
}

ResetSettings() {
	Gui, Main:+OwnDialogs
	MsgBox, 4, Warning, All settings will be deleted.`nDo you wish to continue?

	reset := False

	IfMsgBox, Yes
		reset := True

	If (reset) {
		FileDelete, keybinder_settings.json
		Reload
	}

	Return
}