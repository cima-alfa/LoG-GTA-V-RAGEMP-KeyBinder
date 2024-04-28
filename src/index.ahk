#SingleInstance Force
#MenuMaskKey vkFF

SetWorkingDir %A_ScriptDir%

If (!A_IsAdmin && A_IsCompiled) {
    Try {
        Run *RunAs "%A_ScriptFullPath%" /restart
    }

    ;MsgBox,, Error, Please, start the Keybinder as Admin

    ExitApp
}

#Include, json.ahk
#Include, findtext.ahk
#Include, data.ahk
#Include, setup.ahk
#Include, autoupdate.ahk
#Include, gui.ahk
#Include, heal.ahk
#Include, keybinds.ahk
#Include, commands.ahk
#Include, afk.ahk

#IfWinActive, ahk_class PX_WINDOW_CLASS
	!0::
		If (!A_IsCompiled) {
			Reload
		}
	Return
#IfWinActive