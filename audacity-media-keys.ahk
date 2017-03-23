#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

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
   OutputDebug, AHK Prev TriggeredA
   
   ; Using Audacity's default keyboard shortcut scheme, {left} is jump back 1sec
   ; but while stopped {,} does the same thing
   SendCommandToAudacity("{Left}", "{,}")
Return

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
    
    ; activate audacity
    WinActivate, ahk_id %AudacityId%
    
    if (alternateKey <> "") and (true) 
    {
        ; "wxWindowNR6" is the Stop buttonA
        ControlGet, StopEnabled, Enabled, , Stop, ahk_id %AudacityId%
        OutputDebug, AHK Stop button enabled? %StopEnabled%
        
        if (not StopEnabled)
        {
            ; if we're playing use the alternate key
            key := alternateKey
        }
    }
    
    ; Trigger supplied keyboard shortcut
    OutputDebug, AHK Firing key combo %key%
    SendInput, %key%
    
    ; return focus
    WinActivate, ahk_id %CurrentActiveId%
}

AudacityNotRunning() {
    OutputDebug, AHK Audacity not running - forwarding %A_ThisHotkey%
    ;Send, {%A_ThisHotkey%};;;;;;llooop!
    ;MsgBox, Audacity is not open - please open it and load a file.`nReminder: Normal media key functionality is suppressed while audacity-media-keys is running!`nExit to restore normal behaviour.
}
