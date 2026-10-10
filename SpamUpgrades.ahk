#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2

toggle := false
activePopup := ""

CloseActivePopup() {
	global activePopup
	if (activePopup) {
		try activePopup.Destroy()
		activePopup := ""
	}
}

ShowTogglePopup(accentColor, icon, title, subtitle, scale) {
	global activePopup
	CloseActivePopup()

	popUpWidth := Floor(320 * scale)
	popUpHeight := Floor(90 * scale)

	borderWidth := 3
	cornerRadius := 16
	innerRadius := Max(2, cornerRadius - (borderWidth * 2))
	panelWidth := popUpWidth - (borderWidth * 2)
	panelHeight := popUpHeight - (borderWidth * 2)

	togglePopup := Gui("-Caption +AlwaysOnTop +ToolWindow -DPIScale")
	activePopup := togglePopup
	togglePopup.BackColor := accentColor

	panelCtrl := togglePopup.Add("Text", Format("x{} y{} w{} h{} Background202020", borderWidth, borderWidth, panelWidth, panelHeight))

	togglePopup.SetFont("cWhite s11 Bold", "Segoe UI")
	titleCtrl := togglePopup.Add("Text", "x68 y0 w234 Background202020", title)

	togglePopup.SetFont("cAAAAAA s9 Norm", "Segoe UI")
	subtitleCtrl := togglePopup.Add("Text", "x68 y+2 w234 Background202020", subtitle)

	titleCtrl.GetPos(&tx, &ty, &tw, &th)
	subtitleCtrl.GetPos(&sx, &sy, &sw, &sh)

	blockHeight := (sy + sh) - ty
	blockY := (popUpHeight - blockHeight) // 2

	titleCtrl.Move(, blockY)
	subtitleCtrl.Move(, blockY + (sy - ty))

	iconSize := 36
	togglePopup.SetFont("s18", "Segoe UI Emoji")
	togglePopup.Add("Text", Format("x18 y{} w{} h{} Center 0x200 c{} Background202020", (popUpHeight - iconSize) // 2, iconSize, iconSize, accentColor), icon)

    closeSize := 20
    togglePopup.SetFont("cAAAAAA s10 Bold", "Segoe UI")
    closeCtrl := togglePopup.Add("Text", Format("x{} y{} w{} h{} Center 0x200 Background202020", popUpWidth - borderWidth - closeSize - 6, borderWidth + 6, closeSize, closeSize), "×")
    closeCtrl.OnEvent("Click", ClosePopup)

	MonitorGetWorkArea(, &Left, &Top, &Right, &Bottom)

	xPos := Right - popUpWidth - 20
	yPos := Bottom - popUpHeight - 20

	togglePopup.Show(Format("x{} y{} w{} h{} NA", xPos, yPos, popUpWidth, popUpHeight))
	WinSetRegion(Format("0-0 w{} h{} R{}-{}", popUpWidth, popUpHeight, cornerRadius, cornerRadius), togglePopup)
	WinSetRegion(Format("0-0 w{} h{} R{}-{}", panelWidth, panelHeight, innerRadius, innerRadius), "ahk_id " panelCtrl.Hwnd)

	ClosePopup(*)
	{
		SetTimer(ClosePopup, 0)
		if (activePopup == togglePopup)
			activePopup := ""
		try togglePopup.Destroy()
	}
}

$F1:: {
    global toggle := !toggle
    if (!toggle) {
        CloseActivePopup()
        return
    }
    ShowTogglePopup("00c04b", "🔼", "Top Path", "Top path upgrades are being spammed", 1.0)
    SpamKey("F1")
}

$F2:: {
    global toggle := !toggle
    if (!toggle) {
        CloseActivePopup()
        return
    }
    ShowTogglePopup("00c04b", "▶️", "Middle Path", "Middle path upgrades are being spammed", 1.0)
    SpamKey("F2")
}

$F3:: {
    global toggle := !toggle
    if (!toggle) {
        CloseActivePopup()
        return
    }
    ShowTogglePopup("00c04b", "🔽", "Middle Path", "Middle path upgrades are being spammed", 1.0)
    SpamKey("F3")
}

SpamKey(keyCode) {
    global toggle

    while(toggle) {
        SendEvent "{" . keyCode . "}"
        Sleep(100)
    }
}

