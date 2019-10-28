#/bin/bash

# set alt-drag move and resize settings

gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'

# save terminal settings 
#dconf load /org/gnome/terminal/ > gnome_terminal_settings_backup.txt

# load terminal settings from backup
dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt
