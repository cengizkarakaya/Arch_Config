#!/usr/bin/env bash

if makoctl mode | grep -Fxq "do-not-disturb"; then
    printf '{"text":"","tooltip":"Do Not Disturb: AÇIK","class":"dnd"}\n'
else
    printf '{"text":"","tooltip":"Do Not Disturb: KAPALI","class":"normal"}\n'
fi
