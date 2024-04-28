Documentation() {
	Gui, Documentation:New, -Resize -MaximizeBox, %app_title%
	Gui, Documentation:Font, q2
	Gui, Documentation:Font, s12 Bold
	Gui, Documentation:Add, Text, Section, Documentation
	Gui, Documentation:Font, s9 Normal
	Gui, Documentation:Add, Tab3, y+15, Keybinds|Commands|Variables|Other
	
	Gui, Documentation:Tab, 1

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, w700, Keybinds - Texts
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, Simple keybinds that will send a text upon pressing a hotkey.`nThese also support multiline texts. Use "\n" in the text to create a new line.`n`nFor example "Hello, my name is John Doe.\nPlease, turn off the engine and step out of the car." will look like this:`nHello, my name is John Doe.`nPlease, turn off the engine and step out of the car.

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, y+20 w700, Keybinds - Loops
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, Loop keybinds can be used for countdowns or to repeat a text for up 10 times.`nYou can also set Intro and Outro which will be sent before the loop starts and after it ends respectively.`n`n2 or 3 line text sequence is possible by setting the iterations to 0 or 1.`n0 iterations means that only Intro and Outro will be sent.`n1 iteration will send Intro, Text and Outro.

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, y+20 w700, Cancel Loop
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, This keybind stops any active loop, multiline text or command.

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, y+20 w700, Keybinder On/Off
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, Sets the keybinder state to On or Off.`n`nIf the keybinder is off, it will stop any active loop, multiline text or command.`n`nEvery hotkey and command will be disabled until the keybinder is turned back on.

	Gui, Documentation:Tab, 2

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, w700, Default Commands
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, See the "Default Commands" tab for a list of available commands.`n`nDefault commands CANNOT be overwritten by custom commands.`n`nCommands that accept IDs also accept names or a combination of IDs and names.

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, y+20 w700, Custom Commands
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, Custom commands work exactly the same way as text keybinds. The only difference is that instead of pressing a hotkey you need to write a command in the chat.`n`nCommands can only contain letters and numbers.

	Gui, Documentation:Tab, 3

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, y+20 w700, Variables
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, % "Variables can be used in any text, including intro and outro. The format is: %VARIABLE%"

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, w700, Default Variables
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, % "The keybinder offers the following default variables: %NAME% (Player Name), %FACTION% (Player Faction) and %RANK% (Player Rank)`n`nDefault variables CAN be overwritten by custom variables."

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, y+20 w700, Custom Variables
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, It is possible to create your own variables containing a text.`nIf you create variable TEST, then you can use it in a text as `%TEST`%.`nThese also support multiline texts. Use "\n" in the text to create a new line.`n`nFor example "Hello, my name is John Doe.\nPlease, turn off the engine and step out of the car." will look like this:`nHello, my name is John Doe.`nPlease, turn off the engine and step out of the car.`n`nRemember that loops do NOT support multiline texts, in that case the text will not be split in multiple texts.`n`nYou can also use other variables inside the variable text.`n`nVariables can only contain letters and numbers.

	Gui, Documentation:Tab, 4

	Gui, Documentation:Font, s10 Bold
	Gui, Documentation:Add, Text, w700, Keybinder types letter by letter
	Gui, Documentation:Font, s10 Normal
	Gui, Documentation:Add, Text, y+5 w700, Close the Keybinder, go back in game and type something in the chat. Then open the Keybinder again.

	Gui, Documentation:Tab
	Gui, Documentation:Font, s9

	Gui, Documentation:Add, Button, xs y+15 w150 gDocumentationGuiClose, Close

	Gui, Documentation:Show, Center AutoSize

	Gui, Documentation:+OwnerMain

	Return
}

DocumentationGuiClose() {
	Gui, Documentation:Destroy

	Return
}