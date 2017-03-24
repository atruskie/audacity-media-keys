#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; install routine
; if file not in Documents\AutoHotkey
ExpectedDir := A_MyDocuments "\AutoHotkey"
OutputDebug, AHK Checking %ExpectedDir% is the same as %A_ScriptDir%
if A_ScriptDir <> %ExpectedDir%
{
    ExpectedPath := ExpectedDir "\" A_ScriptName
    OutputDebug, AHK Installing to %ExpectedPath%

    ; copy the exe/script
    FileCreateDir, %ExpectedDir%
    FileCopy, %A_ScriptFullPath%, %ExpectedPath%, 1

    ; create shortcuts on desktop
    OutputDebug, AHK Creating shortcuts %A_Desktop%\Audacity Media Keys.lnk
    FileCreateShortcut, %ExpectedPath%, %A_Desktop%\Audacity Media Keys.lnk
    FileCreateShortcut, %ExpectedPath%, %A_Desktop%\Audacity Media Keys (with F9-F11).lnk, , mapFKeys

    MsgBox, "Audacity Media Keys has been installed!`nUse the shortcuts on your Desktop to start."
    ExitApp, 0
}

; actual logic

#InputLevel 10

Media_Play_Pause::
   OutputDebug, AHK Play Pause Triggered
   
   ; Using Audacity's default keyboard shortcut scheme, shift+a is play/stop where cursor is.
   ; Normal {space} shortcut resets cursor when playback is stopped
   SendCommandToAudacity("+a")
Return

Media_Next::
   OutputDebug, AHK Next Triggered
   
   ; Using Audacity's default keyboard shortcut scheme, {right} is jump forward 1sec
   ; but while paused {.} does the same thing
   SendCommandToAudacity("{Right}", "{.}")
Return

Media_Prev::
   OutputDebug, AHK Prev Triggered
   
   ; Using Audacity's default keyboard shortcut scheme, {left} is jump back 1sec
   ; but while stopped {,} does the same thing
   SendCommandToAudacity("{Left}", "{,}")
Return

#InputLevel 0

if %1% = "mapFkeys"
{
    F9::
        SendLevel, 20
        SendEvent {Media_Prev}
        SendLevel, 0
    Return

    F10::
        SendLevel, 20
        SendEvent {Media_Play_Pause}
        SendLevel, 0
    Return

    F11::
        SendLevel, 20
        SendEvent {Media_Next}
        SendLevel, 0
    Return
}




SendCommandToAudacity(key, alternateKey := "")
{
    OutputDebug, AHK Function called
    ; first get the current window
    WinGet CurrentActiveId, ID, A
    
    ; find audacity
    WinGet AudacityId, ID, ahk_exe audacity.exe
    ;OutputDebug, AHK Audacity exists? %AudacityId%
    if AudacityId =
    {
        AudacityNotRunning()
        return
    }
    
    if (alternateKey <> "") and (true) 
    {
        ; "wxWindowNR6" is the Stop buttonA
        ControlGet, StopEnabled, Enabled, , wxWindowNR6, ahk_id %AudacityId%
        OutputDebug, AHK Stop button enabled? %StopEnabled%
        
        if (not StopEnabled)
        {
            ; if we're playing use the alternate key
            key := alternateKey
        }
    }
    
    ; activate audacity
    WinActivate, ahk_id %AudacityId%

    ; Trigger supplied keyboard shortcut
    OutputDebug, AHK Firing key combo %key%
    SendInput, %key%
    
    ; return focus
    WinActivate, ahk_id %CurrentActiveId%
}

AudacityNotRunning() {
    OutputDebug, AHK Audacity not running - forwarding %A_ThisHotkey%, SendLevel %A_SendLevel%

    SendLevel, 0

    ; send the keypress back to the system
    Send, {%A_ThisHotkey%}

    OutputDebug, AHK SendLevel %A_SendLevel%
}
