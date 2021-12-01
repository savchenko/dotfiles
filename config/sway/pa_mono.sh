#!/bin/bash

M=$(pacmd list-sources | grep -P "name:.*alsa.*input" | head -n 1 | perl -pe 's/.*<//g;s/>.*//g')
pacmd load-module module-remap-source source_name=in_mono master="$M" master_channel_map=front-left channel_map=mono
pactl set-default-source in_mono
