#!/bin/bash

# Define the clock
Clock() {
        DATETIME=$(date "+%a %b %d, %H:%M")

        echo -n "$DATETIME"
}

Wifi() {
    SSID="$(iwgetid -r)"
    if [ "$SSID" != "" ]; then
        echo -e "\uf1eb $SSID"
    else
        echo -e "%{F#FF0000}\uf12a No internet%{F-}"
    fi
}

Battery() {
    TEXT=" "
    PERC="$(acpi --battery | cut -d, -f2 | cut -d ' ' -f2 | cut -d% -f1)"
    DISC="$(acpi --battery | cut -d, -f1 | cut -d ' ' -f3)"
    if [ "$DISC" = "Discharging" ]; then
        if [ "$PERC" -gt "75"  ]; then
            TEXT="\uf240$TEXT"
        elif [ "$PERC" -gt "50" ]; then
            TEXT="\uf242$TEXT"
        elif [ "$PERC" -gt "25" ]; then
            TEXT="\uf243$TEXT"
        else
            TEXT="%{F#FF0000}\uf244$TEXT"
        fi
    else
        TEXT="\uf1e6$TEXT"
    fi
    TEXT="$TEXT $PERC%%{F-}"
    echo -e "$TEXT"
}

Volume() {
    VOL="$(amixer -D pulse sget Master | grep -m 1 -Po '\d+%' | cut -d% -f1)"
    OFF="$(amixer -D pulse sget Master | grep -m 1 -Po '\[(off|on)\]')"
    if [ "$OFF" = "[off]" ]; then
        VOL=0
    fi
    TEXT=""
    if [ "$VOL" -gt "50" ]; then
        TEXT="\uf028"
    elif [ "$VOL" -gt "0" ]; then
        TEXT="\uf027"
    else
        TEXT="\uf026"
    fi
    TEXT="$TEXT $VOL%"
    echo -e "$TEXT"
}

while true; do
    echo -e "%{A:albert toggle:}  \uf0c9%{A}%{c}$(Clock) %{F-}%{B-} %{r}$(Wifi) | $(Battery) | %{A:amixer -D pulse set Master Playback Switch toggle --quiet:}$(Volume)%{A} "
        sleep 1
done
