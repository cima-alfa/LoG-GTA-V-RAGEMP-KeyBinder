global food := []

food["doener"] := []
food["doener"]["1920x1080"] := "|<Döner>*106$28.0zzzwlzzznY88EC64AAsMk1n1X3r0kgVS"
food["doener"]["2560x1440"] := "|<Döner>*108$36.0zzzzzCTzzzzDAA3VUD9YNAXD/ktQbD3kt0bD/ktTbCNYtDb0wAtUbU"
food["doener"]["3440x1440"] := "|<Döner>*109$48.0TzzzzzzD7zzzzzzDXzzzzzzDnUQ1w70Dn6AQtX7DnDAwnnDDmD4wnnDDmTYwk3DDmD4wnzDDbDAwnzDD76AwtnD0TUQww3DU"

food["baklava"] := []
food["baklava"]["1920x1080"] := "|<Baklava>*107$32.1ytzzrTiTzxY+4301M9MZ702Ec1lW1cg10l388"
food["baklava"]["2560x1440"] := "|<Baklava>*106$42.zznnzzz0znnzzzQznnzzzSEH32QVQqGGMRA1yEntNwQEEn190S6GGN2AS6GGtWM0UH21b0U"
food["baklava"]["3440x1440"] := "|<Baklava>*114$56.zzznwzzzzk7zwzDzzzwwTzDnzzzzDbznwzzzzntkQtC3Dg4wtnAnCHmQ0TwmQzaQz3lzADDtbTkyQ33nURb0DaQmQnb/b3tDAn9tknkwHXCHQSCs0S0nUk7bU8"

food["cheeseburger"] := []
food["cheeseburger"]["1920x1080"] := "|<Cheeseburger>*117$61.UTzzzrzzzzbDzzzvzzzzrklV2A9c023v3KCOkoqgBxk010QOs0CSsxz7gBRvrUR208Eki4/zzzzzzzyNzzzzzzzzz1zw"
food["cheeseburger"]["2560x1440"] := "|<Cheeseburger>*118$82.zvzzzzzbzzzzzzUjzzzzyTzzzzzsuzzzzztzzzzzzjsC731VUPq4260zaH9ZwmQjNaH9nyxSjHrdmxiNSbDvo21X0b/qtY2SzjLvzZyQjPkrttyxDbzHtmNjTDbk/q311UUQ6w62TzzzzzzzzzzbDzzzzzzzzzzzywzzzzzzzzzzzzs7zy"
food["cheeseburger"]["3440x1440"] := "|<Cheeseburger>*116$109.zyTzzzzzzwzzzzzzzzw3DzzzzzzyTzzzzzzzwwbzzzzzzzDzzzzzzzwznzzzzzzzbzzzzzzzyzs3sT1s73k7DA30MC0TwQtbCNzAstbaDAtn7DyTNtbgzDAwnnDjAxbbzDgwbmDbaTNtbrYyHnzbq0E1lk3Dgwnta09xznvDtzy9zbqSNy7DwyTtxbyzzYznnDAyTryTbwytvDPnDMtb6TDtvDs6TS3kA3kQ1s3DUC1bzzzzzzzzzzzzzzbnzzzzzzzzzzzzzzzzntzzzzzzzzzzzzzzzzttzzzzzzzzzzzzzzzzy1zzz"

food["apfel"] := []
food["apfel"]["1920x1080"] := "|<Apfel>*106$22.tzXvbyTg802oYVW2u09V8SC0Y/yzzzvzzU"
food["apfel"]["2560x1440"] := "|<Apfel>*106$29.zzy7tnztznXznza6113AgNAmP9mPYUHok9C79jkw6HDVw1b1Dwzzzztzzzznzzz"
food["apfel"]["3440x1440"] := "|<Apfel>*109$39.zzzz3zbnzznzwyTzyTzbVzznzwwD0M63bAstnaAtbDCNtaAtwnDAk3DaM1aSNwnDwblDCNzYz8lnbg7t0SS1bztzzzzzzDzzzzztzzzzzzDzzzw"

food["chips"] := []
food["chips"]["1920x1080"] := "|<Chips>*102$24.kDzzaDzzD1EEDAH7DAH0bAHAUAE0zznzzznzU"
food["chips"]["2560x1440"] := "|<Chips>*108$31.znzzzs9zzztkzzzty1g60z6KNSTb/S7DnZj8btmrb9wtNZq2Qg63zzyzzzzzTzzzzjzk"
food["chips"]["3440x1440"] := "|<Chips>*108$42.zyTzzzzs6TzzzzlmTzzzzbyTzzzz7y0tUD0DyCNXaRDySNXmTDySNbmDDySNbnX7ySNbnsbySNXnwnySNXYws2SNUC1zzzzbzzzzzzbzzzzzzbzzzzzzbzzU"

heal_player(food_type) {
	resolution := settings.other.resolution
	data := food[food_type][resolution]
	
	If (!data) {
		Return
	}

	wh := StrSplit(resolution, "x")

	SendInput, {End}+{Home}{Del}{Enter}i
	Sleep, 100
	CoordMode, Mouse
	MouseMove, 1, 1, 0
	Sleep, 250

	found := FindText(0, 0, wh[1], wh[2], 0.2, 0.2, data)

	If (found) {
		X := found.1.x
		Y := found.1.y

		MouseClick, Left, %X%, %Y%, 1, 0
		MouseMove, 1, 1, 0
		; MouseMove, %X%, %Y%
		; MouseMove, 1, 1, 0
	}

	SendInput, i

	Return
}