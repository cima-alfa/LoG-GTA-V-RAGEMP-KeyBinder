global strafkatalog_title := "Strafkatalog v0.1.5 - Kurzversion"

global allgemeines := []
allgemeines[1] := "Die hier aufgeführten Verstöße werden durch die Staatsfraktionen geahndet"
allgemeines[2] := "Eine Kampfsituation startet sobald mit einer Waffe auf eine Person gezielt wird oder nach dreimaligen Rammen eines Fahrzeuges"

global straftaten := []
straftaten[1] := "Mord eines Staatsfraktionsmitgliedes: 14 Wanteds"
straftaten[2] := "Eröffnung einer Kampfsituation: 10 Wanteds, nicht nach Mord"
straftaten[3] := "Mord an einer Person: 10 Wanteds"
straftaten[4] := "Flucht vor Staatsfraktionen: 6 Wanteds"
straftaten[5] := "Fluchtbeihilfe: 7 Wanteds"
straftaten[6] := "Unerlaubte Betreten von Staatsfraktionseigentum: 25 Wanteds"
straftaten[7] := "Flucht aus dem Gefängnis: 50 Wanteds"
straftaten[8] := "Einbruch in das Gefängnis: 50 Wanteds"
straftaten[9] := "Behinderung der Staatsfraktionen: 7 Wanteds"
straftaten[10] := "Öffentliche Tragen von Waffen: 3 Wanteds"
straftaten[11] := "Wiederholte Sachbeschädigung: 6 Wanteds (Befehlsverweigerung)"
straftaten[12] := "Befehlsverweigerung: 6 Wanteds"
straftaten[13] := "Fahrzeugdiebstahl: 7 Wanteds"
straftaten[14] := "Fahren ohne Fahrerlaubnis: 7 Wanteds"
straftaten[15] := "Wantedpunkte in Ticket umwandeln: $250 je Wanted (Nur bis zu 6 Wanteds)"
straftaten[16] := "Falschparken: $500 Ticket"
straftaten[17] := "Sachbeschädigung: $1000 Ticket"
straftaten[18] := "Unerlaubte Halten auf der Autobahn: $250 Ticket + 1 Punkt"
straftaten[19] := "Nutzung der Autobahn ohne Fahrzeug: $500 Ticket"
straftaten[20] := "Fahren ohne Führerschein: $1000"
straftaten[21] := "Beamtenbeleidigung: $250 Ticket"
straftaten[22] := "Geisterfahrt: 6 Punkte"
straftaten[23] := "Blockieren von Einsatzfahrzeugen: 5 Punkte"
straftaten[24] := "Falschparken: $500 Ticket + 4 Punkte"
straftaten[25] := "Raub (Riot): 25 Wanteds, unmittelbare Schusserlaubnis"
straftaten[26] := "Besitz von Cannabis/Joints: $2.500 Ticket (über 20 g / 2 Stk.)"
straftaten[27] := "Besitz einer Hanfplantage: 10 Wanteds ab der dritten Pflanze"

global schusserlaubnis := []
schusserlaubnis[1] := "Verfolgung von mind. 10 Min. oder 3 erfolgreiche PIT-Versuche"
schusserlaubnis[2] := "Bei Spielern mit mind. 40 Wanteds + Fahrzeug"
schusserlaubnis[3] := "Wenn Beifahrer das Feuer eröffnen (gesamtes Auto)"
schusserlaubnis[4] := "Gruppierung von mind. 4 Wanteds bei Start der Kampfsituation"

Strafkatalog() {
	Gui, Strafkatalog:New, -Resize -MaximizeBox, %app_title%
	Gui, Strafkatalog:Font, q2
	Gui, Strafkatalog:Font, s12 Bold
	Gui, Strafkatalog:Add, Text, Section, %strafkatalog_title%
	Gui, Strafkatalog:Font, s9 Normal
	Gui, Strafkatalog:Add, Tab3, y+15, Straftaten|Schusserlaubnis|Allgemeines

	Gui, Strafkatalog:Tab, 1

	Gui, Strafkatalog:Font, s11 Bold
	Gui, Strafkatalog:Add, Text, Section w700, Straftaten

	Gui, Strafkatalog:Font, s10 Normal

	For index, value in straftaten {	
		Gui, Strafkatalog:Add, Text, xs y+8 w20, % "(" index ")"
		Gui, Strafkatalog:Add, Text, x+10 w670, % value
	}

	Gui, Strafkatalog:Tab, 2

	Gui, Strafkatalog:Font, s11 Bold
	Gui, Strafkatalog:Add, Text, Section w700, Schusserlaubnis

	Gui, Strafkatalog:Font, s10 Normal

	For index, value in schusserlaubnis {	
		Gui, Strafkatalog:Add, Text, xs y+8 w20, % "(" index ")"
		Gui, Strafkatalog:Add, Text, x+10 w670, % value
	}

	Gui, Strafkatalog:Tab, 3

	Gui, Strafkatalog:Font, s11 Bold
	Gui, Strafkatalog:Add, Text, Section w700, Allgemeines

	Gui, Strafkatalog:Font, s10 Normal

	For index, value in allgemeines {	
		Gui, Strafkatalog:Add, Text, xs y+8 w20, % "(" index ")"
		Gui, Strafkatalog:Add, Text, x+10 w670, % value
	}

	Gui, Strafkatalog:Tab
	Gui, Strafkatalog:Font, s9

	Gui, Strafkatalog:Add, Button, Section xs-18 y+15 w150 gStrafkatalogGuiClose, Close

	Gui, Strafkatalog:Show, Center AutoSize

	Gui, Strafkatalog:+OwnerMain

	Return
}

StrafkatalogGuiClose() {
	Gui, Strafkatalog:Destroy

	Return
}