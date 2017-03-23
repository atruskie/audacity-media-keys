# Audacity Media Keys

This is an AutoHotKey script that allows binding the media keys on the keyboard
to Audacity's playback function.

This was created for a very specific use case:

> A user is typing a transcript, they wish to pause and play back media
> without having to change windows or switch to a mouse.

# Install

Either run the install script:

```
PS> . .\install.ps1
```

Or:

1. Install AutoHotKey
  - `choco install autohotkey`
1. Double click on the supplied `audacity-media-keys.ahk` file to run it

## mapFKeys

Lastly, if you do not have media keys on your keyboard you can enable the `mapFKeys` option.

1. Create a shortcut to the `audacity-media-keys.ahk` script
1. In the shortcut's _Properties_, add the string ` mapFKeys` on to the end of the _Target_ field
  - ensure there is a space between the previous text and the new `mapFKeys` text
1. Click on that shortcut to run the script

# Usage

The play, next, and previous media keys are remapped to these behaviours:

- <kbd>Play</kbd>: Plays from the current cursor position, or stops and sets the cursor position
- <kbd>Next</kbd>: Moves the play cursor 1 second forward
- <kbd>Previous</kbd>: Moves the play cursor 1 second backward

If you have enabled the `mapFkeys` option, then the following shortcuts will also be enabled:

- <kbd>F9</kbd>: Plays from the current cursor position, or stops and sets the cursor position
- <kbd>F10</kbd>: Moves the play cursor 1 second forward
- <kbd>F11</kbd>: Moves the play cursor 1 second backward