#!/bin/bash

# Options
shutdown='󰐥 (s)hutdown'
reboot='󰜉 (r)eboot'
lock='󰍁 (l)ock'
suspend='󰽥 s(u)spend'
logout=' (e)xit'

rofi_cmd() {
    rofi -dmenu -config ~/.config/rofi/powermenu.rasi
}

echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
