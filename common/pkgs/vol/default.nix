pkgs:

pkgs.writeScriptBin "vol" ''
  def "main" [] {}

  def "main inc" [] {
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+
      let vol = (wpctl get-volume @DEFAULT_AUDIO_SINK@ | str replace "Volume: " "" | into float) * 100
      nu -c $"eww update EXT_VOL=($vol)"
  }

  def "main dec" [] {
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-
      let vol = (wpctl get-volume @DEFAULT_AUDIO_SINK@ | str replace "Volume: " "" | into float) * 100
      nu -c $"eww update EXT_VOL=($vol)"
  }

  def "main mic" [] {
      wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      let mic = (wpctl get-volume @DEFAULT_AUDIO_SOURCE@) !~ "MUTED"
      nu -c $"eww update EXT_MIC=($mic)"
  }
''
