# Arch Update Script

This repository contains a simple Bash script designed for managing system updates on Arch-based Linux distributions. The script checks for updates in the official repositories, AUR (Arch User Repository), and Flatpak, and provides the user with a summary of available updates. Upon user confirmation, it performs the updates.

> [!NOTE]
> This script was made for my personal use.

## Showcase

![Arch Linux Update Showcase](https://raw.githubusercontent.com/fr0st-iwnl/assets/refs/heads/main/thumbnails/archupdateshowcase.gif)

## Features

- Checks for updates in:
  - Official Arch repositories
  - AUR (using yay or paru)
  - Flatpak
- User confirmation before proceeding with updates
- Outputs the number of available updates in a clear format

## Installation

To use this script, follow these steps:

1. **Download the Script**: Clone this repository to your local machine or copy the `update.sh` file to your desired location.
   ```bash
   git clone https://github.com/fr0st-iwnl/arch-update.git
   ```

## Steps to Create the Custom Command

1. **Create the `bin` Directory**  
   Create a folder called `bin` in `~/.local/share/`. If it already exists, simply add the `update.sh` script there and rename it to `update` (removing the `.sh` extension).

   ```bash
   mkdir -p ~/.local/share/bin
   cp /path/to/update.sh ~/.local/share/bin/update
   ```

1. **Make `update` executable**  
   Give the `update` permissions to run.

   ```bash
   chmod +x ~/.local/share/bin/update
   ```

**Update Your Shell Configuration:**
Add the following line to your `~/.bashrc` or `~/.zshrc`:

```bash
export PATH="$HOME/.local/share/bin:$PATH"
```

**Reload Your Terminal:**
Run the following command to apply the changes:

```bash
source ~/.bashrc
```
**or**

```bash
source ~/.zshrc
```
   

   
