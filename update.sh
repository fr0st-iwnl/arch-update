#!/usr/bin/env bash

# Arch-based
if [ ! -f /etc/arch-release ]; then
    echo "This script only works on Arch-based systems."
    exit 1
fi

# function to check if a package is installed
pkg_installed() {
    pacman -Qq "$1" &> /dev/null
}

# function to perform updates
update_system() {
    echo "Starting the system update..."

    # Update Official packages
    echo "Updating Official packages..."
    sudo pacman -Syu

    # Update AUR packages
    if pkg_installed yay; then
        echo "Updating AUR packages using yay..."
        yay -Syu
    elif pkg_installed paru; then
        echo "Updating AUR packages using paru..."
        paru -Syu
    else
        echo "AUR helper not installed, skipping AUR updates."
    fi

    # Update Flatpak packages
    if pkg_installed flatpak; then
        echo "Updating Flatpak packages..."
        flatpak update
    else
        echo "Flatpak not installed, skipping Flatpak updates."
    fi

    echo "System update completed."
}

# check for Official updates
ofc=$( (while pgrep -x checkupdates > /dev/null ; do sleep 1; done) ; checkupdates | wc -l)

# Check for AUR updates
if pkg_installed yay; then
    aur=$(yay -Qua | wc -l)
elif pkg_installed paru; then
    aur=$(paru -Qua | wc -l)
else
    aur="AUR helper not installed"
fi

# Check for Flatpak updates
if pkg_installed flatpak; then
    fpk=$(flatpak remote-ls --updates | wc -l)
else
    fpk="Flatpak not installed"
fi

# Output the update status
echo "[Official] $ofc"
echo "[AUR]      $aur"
echo "[Flatpak]  $fpk"

# ask user
read -p "Do you want to update the system? (Y/N): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    update_system
else
    echo "Update canceled."
fi
