#!/bin/bash

# Define options
options="Shutdown\nReboot\nLogout\nSuspend"

# Show menu using dmenu
choice=$(echo -e $options | dmenu -i -p "Power")

# Execute based on choice
case "$choice" in
    "Shutdown")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Logout")
        i3-msg exit
        ;;
    "Suspend")
        systemctl suspend
        ;;
esac
