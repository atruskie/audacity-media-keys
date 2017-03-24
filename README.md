# Audacity Media Keys

[![Build status](https://ci.appveyor.com/api/projects/status/bucrrf2eybpqeurf?svg=true)](https://ci.appveyor.com/project/antmt/audacity-media-keys

This is an AutoHotKey script that allows binding the media keys on the keyboard
to Audacity's playback function.

This was created for a very specific use case:

> A user is typing a transcript, they wish to pause and play back media
> without having to change windows or switch to a mouse.

# Download and Install

1. Go to the _Releases_ page
2. Download the lastest `audacity-media-keys.exe`
3. Once downloaded, run `audacity-media-keys.exe` to install it
4. Run the script by using the new shortcuts on your desktop

# Manual install

1. Install _AutoHotkey_
  - `choco install autohotkey`
  - Or do a manual install by getting the installer from https://autohotkey.com/download/
2. Download the `audacity-media-keys.ahk` script and save it to:
`..\Documents\AutoHotkey\audacity-media-keys.ahk`
3. Double click on the supplied `audacity-media-keys.ahk` file to run it

## mapFKeys

Lastly, if you do not have media keys on your keyboard you can enable the `mapFKeys` option.

1. Create a shortcut to the `audacity-media-keys.ahk` script
2. In the shortcut's _Properties_, add the string ` mapFKeys` on to the end of the _Target_ field
  - ensure there is a space between the previous text and the new `mapFKeys` text
3. Click on that shortcut to run the script

# Usage

The play, next, and previous media keys are remapped to these behaviours:

- <kbd>Play</kbd>: Plays from the current cursor position, or stops and sets the cursor position
- <kbd>Next</kbd>: Moves the play cursor 1 second forward
- <kbd>Previous</kbd>: Moves the play cursor 1 second backward

If you have enabled the `mapFKeys` option, then the following shortcuts will also be enabled:

- <kbd>F9</kbd>: Plays from the current cursor position, or stops and sets the cursor position
- <kbd>F10</kbd>: Moves the play cursor 1 second forward
- <kbd>F11</kbd>: Moves the play cursor 1 second backward