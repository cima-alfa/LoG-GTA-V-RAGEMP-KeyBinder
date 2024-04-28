global version := "1.4.8"
global update_url := "https://keybinder.cima-alfa.com/download/"
global download_url := "https://keybinder.cima-alfa.com/download/keybinder.exe"

oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWhr.Open("GET", update_url, False)
oWhr.SetRequestHeader("Content-Type", "application/json")
oWhr.Send()

global version_new := JSON.Load(oWhr.ResponseText).version

global general_title := "LSPD | FIB Keybinder v"
global app_title := general_title version
global patch_notes_title := general_title version_new