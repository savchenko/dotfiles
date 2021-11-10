#!/usr/bin/env bash
#
# ALSA card/device switcher
#
IFS=
cards_list="$(aplay -l | grep ^card | sed -r 's/^card\s([0-9].*:\s.*)\s\[.*/card\ \1/')"
devices_count="$(echo -e "$cards_list" | uniq | wc -l)"
if [ "$devices_count" -lt 30 ]; then
  choice=$(echo "$cards_list" | wofi -L "$devices_count" -W 600 -i -b -d -p 'Audiocards' -O 'alphabetical')
  asoundrc="$HOME/.asoundrc"
  if [[ -n "$choice" ]]; then
    card=$(echo "$choice" | cut -d":" -f1 | rev | cut -b1)
    device=$(echo "$choice" | cut -d":" -f2 | rev | cut -b1)
    description=$(echo "$choice" | sed -r 's/(^.*\[)(.*)(\].*)/\2/')
    grep -E -q 'card\s[0-9]' "$asoundrc" && sed -r -i "s/(card\s)[0-9]/\1$card/g" "$asoundrc"
    grep -E -q 'device\s[0-9]' "$asoundrc" && sed -r -i "s/(device\s)[0-9]/\1$device/g" "$asoundrc"
    if [ $? -eq 0 ]; then
      # alsaucm reload
      pkill --full --exact mpd
      mpd
    fi
    if [[ -n "$TERM" && -n "$COLORTERM" ]]; then
      echo "Switching to card #$card and device #$device ($description)"
    else
      notify-send "$description" "Switching to card #$card and device #$device"
    fi
  else
    :
  fi
else
  notify-send -c "hardware" -t 8000 -u critical \
    "More than 30 audio outputs detected! Are you using the right tool?"
fi
