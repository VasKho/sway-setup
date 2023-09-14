#!/bin/sh

USER_CONFIG_PATH=$HOME/.config/waybar/config.jsonc
USER_STYLE_PATH=$HOME/.config/waybar/style.css

if [ -f $USER_CONFIG_PATH ]; then
    USER_CONFIG=$USER_CONFIG_PATH
fi

if [ -f $USER_STYLE_PATH ]; then
    USER_STYLE=$USER_STYLE_PATH
fi

waybar -c ${USER_CONFIG} -s ${USER_STYLE} &
