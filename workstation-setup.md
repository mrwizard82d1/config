# Workstation Setup

## Windows Setup

- Install Dvorak keyboard
- Open File Explorer
  - Change to file open with single click

## Browser Setup

- Install chrome
- Add all my user identities
- Restart chrome
- Log in to Last Pass

### Install uncap

- mkdir ~/.bin
- Open github.com/susam/uncap#readme in browse
- Find link on page to `uncap.exe`
- cp ~/Downloads/uncap.exe ~/.bin/
- Open ~/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup
- Run `nvim-qt.exe uncap_startup.bat`
- Enter the text `uncap 0x1b:0x14
- Close editor
- Restart system

## Basic Application Setup

- Install chocolatey
- Install gvim
- Install neovim
- Install sizer
- Install Total Commander
- Install RapidEE
- Install 7-zip

### Install Doom Emacs

- Install emacs
- Set environment variable:
  - e. g. HOME=C:/users/jones

### Install .ssh keys

- Create directory ~/.ssh
- Copy key files to ~/.ssh

### Configure Rider

- Open project in Rider
- In customize dialog,
  - Dark theme
  - IntelliJ keymap
  - .NET core environment
  - Plugins
    - IdeaVim
    - SpecFlow

### Configure git bash in Windows Terminal

- Open the JSON file for Windows Terminal
- Add a section like the following. You **will** need to change the `guid` value to a new GUID.

```
            {
                "commandline": "c:\\Program Files\\Git\\bin\\bash.exe",
                "guid": "{315998ed-490d-45e1-9c28-caf0ae8dc241}",
                "hidden": false,
                "icon": "C:\\Program Files\\Git\\mingw64\\share\\git\\git-for-windows.ico",
                "name": "bash for git",
		"startingDirectory": "C:\\Users\\jones"
            }
```

- Copy .bash_profile and .bashrc from OneDrive to $HOME
