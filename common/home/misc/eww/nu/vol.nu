(wpctl get-volume @DEFAULT_AUDIO_SINK@ | str replace "Volume: " "" | into decimal) * 100
