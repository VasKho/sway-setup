#!/bin/bash

for f in *; do
    if [ -d "$f" ]; then
        cp -r $f ~/.config/
    fi
done

