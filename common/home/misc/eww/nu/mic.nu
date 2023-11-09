if (wpctl get-volume @DEFAULT_AUDIO_SOURCE@) =~ "MUTED" { { state: "off", color: "#eb6f92" } } else { { state: "on", color: "#31748f" } } | to json -r
