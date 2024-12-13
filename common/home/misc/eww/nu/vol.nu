#!/usr/bin/env nu
(wpctl get-volume @DEFAULT_AUDIO_SINK@ | str replace "Volume: " "" | into float) * 100
