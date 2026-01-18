#Requires AutoHotkey v2.0


; -------------------------
; Hotkeys
; -------------------------

Pause::      LookupReuse("kielitoimisto", "https://www.kielitoimistonsanakirja.fi/#/")
ScrollLock:: LookupReuse("google",       "https://www.google.com/search?q=")
!w::         LookupReuse("synonyymit",   "https://www.synonyymit.fi/")

; -------------------------
; Per-site tab tracking
; -------------------------

global SiteTabs := Map()

; -------------------------
; Lookup logic
; -------------------------

LookupReuse(siteKey, baseUrl)
{
    clipSaved := ClipboardAll()
    A_Clipboard := ""
    Send("^c")

    if !ClipWait(0.5)
    {
        A_Clipboard := clipSaved
        return
    }

    text := Trim(A_Clipboard)
    A_Clipboard := clipSaved
    if (text = "")
        return

    text := StrReplace(text, "`r", "")
    text := StrReplace(text, "`n", "")
    url := baseUrl . UriEncodeUtf8(text)

    ; If we don't yet have a tab for this site, open one
    if !SiteTabs.Has(siteKey)
    {
        Run(url)
        SiteTabs[siteKey] := true
        return
    }

    ; Reuse existing tab
    if !ActivateBrowser()
    {
        ; Browser likely closed → reopen
        Run(url)
        return
    }

    Send("^l")          ; focus address bar
    Sleep(50)
    SendText(url)
    Send("{Enter}")
}

; -------------------------
; Try to activate a browser window
; -------------------------

ActivateBrowser()
{
    browsers := ["ahk_exe chrome.exe"
               , "ahk_exe msedge.exe"
               , "ahk_exe firefox.exe"]

    for win in browsers
    {
        if WinExist(win)
        {
            WinActivate
            return true
        }
    }
    return false
}

; -------------------------
; UTF-8 URL encoding
; -------------------------

UriEncodeUtf8(s)
{
    bufSize := StrPut(s, "UTF-8")
    buf := Buffer(bufSize)
    StrPut(s, buf, "UTF-8")

    out := ""
    i := 0
    while (i < bufSize - 1)
    {
        b := NumGet(buf, i, "UChar")
        i++

        if ( (b >= 0x41 && b <= 0x5A)
          || (b >= 0x61 && b <= 0x7A)
          || (b >= 0x30 && b <= 0x39)
          || b = 0x2D || b = 0x5F || b = 0x2E || b = 0x7E )
        {
            out .= Chr(b)
        }
        else if (b = 0x20)
        {
            out .= "+"
        }
        else
        {
            out .= "%" Format("{:02X}", b)
        }
    }
    return out
}
