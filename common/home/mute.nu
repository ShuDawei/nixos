#!/usr/bin/env nu

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
let mic = (wpctl get-volume @DEFAULT_AUDIO_SOURCE@) !~ "MUTED"
nu -c $"eww update EXT_MIC=($mic)"
