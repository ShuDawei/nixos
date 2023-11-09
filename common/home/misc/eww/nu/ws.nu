def ws [] {
    let active = hyprctl monitors -j
        | from json
        | where focused == true
        | get activeWorkspace.id.0
    let ws = hyprctl workspaces -j
        | from json
        | get id
        | sort
        | wrap id
        | each { |ws| insert active ($ws.id == $active) }
        | each { |ws| $ws | update id (roman $ws.id) }
    $ws | to json -r | print
}

def roman [num] {
    match $num {
        1 => "I",
        2 => "II",
        3 => "III",
        4 => "IV",
        5 => "V",
        6 => "VI",
        7 => "VII",
        8 => "VIII",
        9 => "IX",
        10 => "X",
    }
}

ws
socat -u $"UNIX-CONNECT:/tmp/hypr/($env.HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock" - | each { ws }
