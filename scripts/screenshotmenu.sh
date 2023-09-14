#!/bin/bash

# Options
output_clip='󰹑 (o)utput, (s)creen, (f)ocused, (w)indow, (a)rea + Shift for '

rofi_cmd() {
    rofi -dmenu -config ~/.config/rofi/screenshotmenu.rasi
}

echo -e "$output_clip" | rofi_cmd
