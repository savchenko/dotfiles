#!/bin/bash

read lcd < "$TMPDIR/lcd"
    if [ "$lcd" -eq "0" ]; then
        swaymsg "output * dpms on"
        echo 1 > "$TMPDIR/lcd"
    else
        swaymsg "output * dpms off"
        echo 0 > "$TMPDIR/lcd"
    fi
