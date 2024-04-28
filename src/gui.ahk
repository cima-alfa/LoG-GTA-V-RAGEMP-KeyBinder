#Include, documentation.ahk
#Include, strafkatalog.ahk

Menu, AppMenu, Add, Save, SaveSettings
Menu, AppMenu, Add
Menu, AppMenu, Add, Restart, RestartKeybinder
Menu, AppMenu, Add
Menu, AppMenu, Add, Exit, MainGuiClose

Menu, HelpMenu, Add, Documentation, Documentation
Menu, HelpMenu, Add
Menu, HelpMenu, Add, Patch Notes, PatchNotes
Menu, HelpMenu, Add
Menu, HelpMenu, Add, Strafkatalog, Strafkatalog
Menu, HelpMenu, Add
Menu, HelpMenu, Add, Reset Settings, ResetSettings

Menu, MainMenu, Add, Application, :AppMenu
Menu, MainMenu, Add, Help, :HelpMenu

Gui, Main:New, -Resize -MaximizeBox, %app_title%
Gui, Main:Menu, MainMenu
Gui, Main:Add, Tab3,, Keybinds - Texts|Keybinds - Loops|Keybinds - Heal|Custom Commands|Default Commands|Custom Variables|Settings
Gui, Main:Font, q2 s9

Gui, Main:Tab, 1

Gui, Main:Add, Text, Section w75, Hotkey
Gui, Main:Add, Text, x+10 w365, Text
Gui, Main:Add, Hotkey, xs y+5 w75 vKeybindsTextsHotkey0, % settings.keybinds.texts[0].hotkey
Gui, Main:Add, Edit, x+10 r1 w365 vKeybindsTextsText0, % settings.keybinds.texts[0].text

gui_loop := keybinds_texts - 1

Loop, %gui_loop% {
	If (A_Index & 1) {
		Gui, Main:Add, Text, x+30 ys w75, Hotkey
		Gui, Main:Add, Text, x+10 w365, Text
		Gui, Main:Add, Hotkey, x+-450 y+5 w75 vKeybindsTextsHotkey%A_Index%, % settings.keybinds.texts[A_Index].hotkey
		Gui, Main:Add, Edit, x+10 r1 w365 vKeybindsTextsText%A_Index%, % settings.keybinds.texts[A_Index].text
	} Else {
		Gui, Main:Add, Text, Section xs y+8 w75, Hotkey
		Gui, Main:Add, Text, x+10 w365, Text
		Gui, Main:Add, Hotkey, xs y+5 w75 vKeybindsTextsHotkey%A_Index%, % settings.keybinds.texts[A_Index].hotkey
		Gui, Main:Add, Edit, x+10 r1 w365 vKeybindsTextsText%A_Index%, % settings.keybinds.texts[A_Index].text
	}
}

Gui, Main:Tab, 2

reverse := !settings.keybinds.loops[0].reverse ? "" : "Checked"

Gui, Main:Add, Text, Section w75, Hotkey
Gui, Main:Add, Text, x+10 w135, Text
Gui, Main:Add, Text, x+10 w65, Iterations
Gui, Main:Add, Text, x+10 w65, Pause
Gui, Main:Add, Text, x+10 w70
Gui, Main:Add, Hotkey, xs y+5 w75 vKeybindsLoopsHotkey0, % settings.keybinds.loops[0].hotkey
Gui, Main:Add, Edit, x+10 w135 vKeybindsLoopsText0, % settings.keybinds.loops[0].text
Gui, Main:Add, Edit, x+10 w65 vKeybindsLoopsIterations0, % settings.keybinds.loops[0].iterations
Gui, Main:Add, Edit, x+10 w65 vKeybindsLoopsPause0, % settings.keybinds.loops[0].pause
Gui, Main:Add, Checkbox, x+10 yp+5 w70 %reverse% vKeybindsLoopsReverse0, Reverse
Gui, Main:Add, Text, xs y+10 w220, Intro
Gui, Main:Add, Text, x+10 w220, Outro
Gui, Main:Add, Edit, xs y+5 r1 w220 vKeybindsLoopsIntro0, % settings.keybinds.loops[0].intro
Gui, Main:Add, Edit, x+10 w220 vKeybindsLoopsOutro0, % settings.keybinds.loops[0].outro

gui_loop := keybinds_loops - 1

Loop, %gui_loop% {
	reverse := !settings.keybinds.loops[A_Index].reverse ? "" : "Checked"

	If (A_Index & 1) {
		Gui, Main:Add, Text, x+30 ys w75, Hotkey
		Gui, Main:Add, Text, x+10 w135, Text
		Gui, Main:Add, Text, x+10 w65, Iterations
		Gui, Main:Add, Text, x+10 w65, Pause
		Gui, Main:Add, Text, x+10 w70
		Gui, Main:Add, Hotkey, x+-450 y+5 w75 vKeybindsLoopsHotkey%A_Index%, % settings.keybinds.loops[A_Index].hotkey
		Gui, Main:Add, Edit, x+10 w135 vKeybindsLoopsText%A_Index%, % settings.keybinds.loops[A_Index].text
		Gui, Main:Add, Edit, x+10 w65 vKeybindsLoopsIterations%A_Index%, % settings.keybinds.loops[A_Index].iterations
		Gui, Main:Add, Edit, x+10 w65 vKeybindsLoopsPause%A_Index%, % settings.keybinds.loops[A_Index].pause
		Gui, Main:Add, Checkbox, x+10 yp+5 w70 %reverse% vKeybindsLoopsReverse%A_Index%, Reverse
		Gui, Main:Add, Text, x+-450 y+10 w220, Intro
		Gui, Main:Add, Text, x+10 w220, Outro
		Gui, Main:Add, Edit, x+-450 y+5 r1 w220 vKeybindsLoopsIntro%A_Index%, % settings.keybinds.loops[A_Index].intro
		Gui, Main:Add, Edit, x+10 w220 vKeybindsLoopsOutro%A_Index%, % settings.keybinds.loops[A_Index].outro
	} Else {
		Gui, Main:Add, Text, Section xs y+20 w75, Hotkey
		Gui, Main:Add, Text, x+10 w135, Text
		Gui, Main:Add, Text, x+10 w65, Iterations
		Gui, Main:Add, Text, x+10 w65, Pause
		Gui, Main:Add, Text, x+10 w70
		Gui, Main:Add, Hotkey, xs y+5 w75 vKeybindsLoopsHotkey%A_Index%, % settings.keybinds.loops[A_Index].hotkey
		Gui, Main:Add, Edit, x+10 w135 vKeybindsLoopsText%A_Index%, % settings.keybinds.loops[A_Index].text
		Gui, Main:Add, Edit, x+10 w65 vKeybindsLoopsIterations%A_Index%, % settings.keybinds.loops[A_Index].iterations
		Gui, Main:Add, Edit, x+10 w65 vKeybindsLoopsPause%A_Index%, % settings.keybinds.loops[A_Index].pause
		Gui, Main:Add, Checkbox, x+10 yp+5 w70 %reverse% vKeybindsLoopsReverse%A_Index%, Reverse
		Gui, Main:Add, Text, xs y+10 w220, Intro
		Gui, Main:Add, Text, x+10 w220, Outro
		Gui, Main:Add, Edit, xs y+5 r1 w220 vKeybindsLoopsIntro%A_Index%, % settings.keybinds.loops[A_Index].intro
		Gui, Main:Add, Edit, x+10 w220 vKeybindsLoopsOutro%A_Index%, % settings.keybinds.loops[A_Index].outro
	}
}

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, Section xs y+20 w296, Intro
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w296, Text before the loop starts.

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, x+20 ys w296, Outro
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w296, Text after the loop ends.

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, x+20 ys w296, Iterations
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w296, Number of times the loop should be repeated.`n(Min: 0, Max: 10)

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, Section xs y+15 w296, Pause
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w296, Number of seconds between each iteration.`n(Min: 0.5, Max: 3)

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, x+20 ys w296, % "Variable %N%"
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w296, Number of the current iteration. Can be used in "Text", "Intro" and "Outro".

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, x+20 ys w296, Reverse
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w296, If checked, the loop will go in reverse.`n

Gui, Main:Tab, 3
Gui, Main:Font, s9

Gui, Main:Add, Text, Section w130, Döner
Gui, Main:Add, Hotkey, y+5 w130 vKeybindsHealDoener, % settings.keybinds.heal.doener.hotkey

Gui, Main:Add, Text, x+30 ys w130, Baklava
Gui, Main:Add, Hotkey, y+5 w130 vKeybindsHealBaklava, % settings.keybinds.heal.baklava.hotkey

Gui, Main:Add, Text, x+30 ys w130, Cheeseburger
Gui, Main:Add, Hotkey, y+5 w130 vKeybindsHealCheeseburger, % settings.keybinds.heal.cheeseburger.hotkey

Gui, Main:Add, Text, x+30 ys w130, Apple
Gui, Main:Add, Hotkey, y+5 w130 vKeybindsHealApple, % settings.keybinds.heal.apfel.hotkey

Gui, Main:Add, Text, x+30 ys w130, Chips
Gui, Main:Add, Hotkey, y+5 w130 vKeybindsHealChips, % settings.keybinds.heal.chips.hotkey

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, Section xs y+20 w930, Important
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w930, Your native display resolution and ingame resolution must be the same.`nSupported modes are Fullscreen and Windowed Borderless.`nWindowed mode may or may not work.
Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, Section xs y+20 w930, Supported Resolutions
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w930, 1920x1080`n2560x1440`n3440x1440`nBefore you use the heal function, set your display resolution in the keybinder settings tab.`nIf the heal function doesn't work for you, PM me on TS or Forum.

Gui, Main:Tab, 4
Gui, Main:Font, s9

Gui, Main:Add, Text, Section w75, Command
Gui, Main:Add, Text, x+10 w365, Text
Gui, Main:Add, Edit, xs y+5 r1 w75 vCommandsCmd0, % settings.commands[0].cmd
Gui, Main:Add, Edit, x+10 r1 w365 vCommandsText0, % settings.commands[0].text

gui_loop := custom_commands - 1

Loop, %gui_loop% {
	If (A_Index & 1) {
		Gui, Main:Add, Text, x+30 ys w75, Command
		Gui, Main:Add, Text, x+10 w365, Text
		Gui, Main:Add, Edit, x+-450 r1 y+5 w75 vCommandsCmd%A_Index%, % settings.commands[A_Index].cmd
		Gui, Main:Add, Edit, x+10 r1 w365 vCommandsText%A_Index%, % settings.commands[A_Index].text
	} Else {
		Gui, Main:Add, Text, Section xs y+8 w75, Command
		Gui, Main:Add, Text, x+10 w365, Text
		Gui, Main:Add, Edit, xs y+5 r1 w75 vCommandsCmd%A_Index%, % settings.commands[A_Index].cmd
		Gui, Main:Add, Edit, x+10 r1 w365 vCommandsText%A_Index%, % settings.commands[A_Index].text
	}
}

Gui, Main:Tab, 5
Gui, Main:Font, s10

Gui, Main:Font, s11 Bold
Gui, Main:Add, Text, Section w930, Commands

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, y+15 w930, /att ID [ID ID ID...]
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w930, Gives "Attack" wanteds to specified ID(s). Accepts 1 or more IDs/Names separated by a space or comma.

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, y+15 w930, /fl ID [ID ID ID...]
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w930, Gives "Flucht" wanteds to specified ID(s). Accepts 1 or more IDs/Names separated by a space or comma.

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, y+15 w930, /fb ID [ID ID ID...]
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w930, Gives "Fluchtbeihilfe" wanteds to specified ID(s). Accepts 1 or more IDs/Names separated by a space or comma.

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, y+15 w930, /cl Reason ID [ID ID ID...]
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w930, Clears wanteds for specified ID(s). Accepts 1 or more IDs/Names separated by a space or comma.

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, y+15 w930, /ow
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w930, Shows wanteds list.

Gui, Main:Font, s10 Bold
Gui, Main:Add, Text, y+15 w930, /ge ID [ID ID ID...]
Gui, Main:Font, s10 Normal
Gui, Main:Add, Text, y+5 w930, Gives "Geiterfahrt" points to specified ID(s). Accepts 1 or more IDs/Names separated by a space or comma.

Gui, Main:Add, Text, y+20 w930, Commands that accept IDs can also accept names.

Gui, Main:Tab, 6
Gui, Main:Font, s9

Gui, Main:Add, Text, Section w75, Variable
Gui, Main:Add, Text, x+10 w365, Text
Gui, Main:Add, Edit, xs y+5 r1 w75 vVariablesVar0, % settings.variables[0].var
Gui, Main:Add, Edit, x+10 r1 w365 vVariablesText0, % settings.variables[0].text

gui_loop := custom_variables - 1

Loop, %gui_loop% {
	If (A_Index & 1) {
		Gui, Main:Add, Text, x+30 ys w75, Variable
		Gui, Main:Add, Text, x+10 w365, Text
		Gui, Main:Add, Edit, x+-450 r1 y+5 w75 vVariablesVar%A_Index%, % settings.variables[A_Index].var
		Gui, Main:Add, Edit, x+10 r1 w365 vVariablesText%A_Index%, % settings.variables[A_Index].text
	} Else {
		Gui, Main:Add, Text, Section xs y+8 w75, Variable
		Gui, Main:Add, Text, x+10 w365, Text
		Gui, Main:Add, Edit, xs y+5 r1 w75 vVariablesVar%A_Index%, % settings.variables[A_Index].var
		Gui, Main:Add, Edit, x+10 r1 w365 vVariablesText%A_Index%, % settings.variables[A_Index].text
	}
}

Gui, Main:Tab, 7
Gui, Main:Font, s9

Gui, Main:Add, Text, Section w130, Keybinder On/Off
Gui, Main:Add, Hotkey, y+5 w130 vKeybindsSettingsToggleKeybinder, % settings.keybinds.settings.togglekeybinder.hotkey

Gui, Main:Add, Text, x+30 ys w130, Cancel Loop
Gui, Main:Add, Hotkey, y+5 w130 vKeybindsSettingsCancelLoop, % settings.keybinds.settings.cancelloop.hotkey

Gui, Main:Add, Text, Section xs y+15 w183, Player Name
Gui, Main:Add, Edit, y+5 r1 w183 vPlayerName, % settings.player.name

Gui, Main:Add, Text, x+31 ys w183, Player Faction
Gui, Main:Add, Edit, y+5 r1 w183 vPlayerFaction, % settings.player.faction

Gui, Main:Add, Text, x+30 ys w183, Player Rank
Gui, Main:Add, Edit, y+5 r1 w183 vPlayerRank, % settings.player.rank

Gui, Main:Add, Text, Section xs y+15 w130, Menu Nav Up
Gui, Main:Add, Hotkey, y+5 w130 vOtherNavUp, % settings.other.navup

Gui, Main:Add, Text, x+30 ys w130, Menu Nav Down
Gui, Main:Add, Hotkey, y+5 w130 vOtherNavDown, % settings.other.navdown

Gui, Main:Add, Text, x+30 ys w130, Menu Nav Left
Gui, Main:Add, Hotkey, y+5 w130 vOtherNavLeft, % settings.other.navleft

Gui, Main:Add, Text, x+30 ys w130, Menu Nav Right
Gui, Main:Add, Hotkey, y+5 w130 vOtherNavRight, % settings.other.navright

Gui, Main:Add, Text, Section xs y+15 w183, Display Resolution
Gui, Main:Add, DropDownList, y+5 r4 w183 vOtherResolution Choose1, Choose|1920x1080|2560x1440|3440x1440
GuiControl, ChooseString, OtherResolution, % settings.other.resolution

afk_timer := !settings.other.afk_timer ? "" : "Checked"

Gui, Main:Add, Checkbox, Section xs y+15 w183 %afk_timer% vOtherAfkTimer, AFK Timer (9 min. 30 sec.)

Gui, Main:Tab
Gui, Main:Font, s9

Gui, Main:Add, Button, Section y+15 w125 gSaveSettings, Save
Gui, Main:Add, Button, x+640 w90 gStrafkatalog, Strafkatalog
Gui, Main:Add, Button, x+10 w90 gRestartKeybinder, Restart

Gui, Main:Font, s7
Gui, Main:Add, Text, xs y+10, Keybinder by Jeremy

Gui, Main:Show, Center AutoSize

Gui, Main:+OwnDialogs

; Gui, +LastFound

; WinGetTitle, GuiTitle

; global GuiTitle := GuiTitle

RestartKeybinder() {
	Reload
	Return
}

MainGuiClose() {
	ExitApp
	Return
}