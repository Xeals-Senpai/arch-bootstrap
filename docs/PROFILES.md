# Profiles

Profiles control which optional components are installed.

A profile does not represent hardware.

A profile represents the intended role of the machine.

## Profile Philosophy

Profiles describe the role of the machine rather than the hardware itself.

Examples:

- A laptop can use the server profile.
- A desktop can use the laptop profile.
- A workstation can run without Bluetooth or SSH.

Profiles enable or disable groups of functionality based on the intended role of the system.

## Available Profiles

### workstation

Daily-use machine.

Includes:

- Bluetooth
- SSH
- Discord
- Signal
- Spotify
- Spicetify
- WhatsApp web app
- VS Code
- Nemo
- Development tools

### laptop

Portable workstation.

Includes:

- Everything from workstation
- Power management tools

### server

Headless system.

Excludes:

- Desktop applications
- Social applications
- Multimedia applications