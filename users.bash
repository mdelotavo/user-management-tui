#!/bin/bash -e

ACTION="<-- Back"

while [ "$ACTION" == "<-- Back" ]; do
    ACTION=$(whiptail --title "User Management System" --menu "Choose an option" 25 78 16 \
        "Add User" "Add a user to the system." \
        "Modify User" "Modify an existing user." \
        "List Users" "List all users on the system." \
        "Add Group" "Add a user group to the system." \
        "Modify Group" "Modify a group and its list of members." \
        "List Groups" "List all groups on the system." \
        "Custom Commands" "Run custom administrative commands." 3>&1 1>&2 2>&3)
    if [ "$ACTION" == "List Users" ]; then
        MSGBOX=$(whiptail --title "/etc/passwd" --scrolltext --msgbox "$(cat /etc/passwd)" 25 100 3>&1 1>&2 2>&3)
        ACTION="<-- Back"
    elif [ "$ACTION" == "Custom Commands" ]; then
        COMMAND=$(whiptail --inputbox "Enter command path with arguments:" 8 78 "whoami" --title "Command Dialog" 3>&1 1>&2 2>&3)
        exitstatus=$?
        eval "$COMMAND" | less
        ACTION="<-- Back"
    fi
done
