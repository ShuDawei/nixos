''
monitor =     DP-1, 1920x1080@240, 0x0   , 1
monitor = HDMI-A-1, 1920x1080@60 , 1920x0, 1

workspace = 1, monitor:DP-1
workspace = 2, monitor:DP-1
workspace = 3, monitor:DP-1
workspace = 4, monitor:DP-1
workspace = 5, monitor:DP-1
workspace = 6, monitor:DP-1
workspace = 7, monitor:DP-1
workspace = 8, monitor:HDMI-A-1
workspace = 9, monitor:HDMI-A-1
workspace = 10, monitor:HDMI-A-1

env = XCURSOR_SIZE,24
env = WLR_NO_HARDWARE_CURSORS, 1
env = NIXOS_OZONE_WL, 1

input {
    kb_layout = de
    follow_mouse = 2
    sensitivity = -0.25 # -1.0 - 1.0, 0 means no modification.
}

general {
    gaps_in = 8
    gaps_out = 24
    border_size = 0
    col.active_border = rgb(00ffff) rgb(ff00ff) 45deg
    col.inactive_border = rgb(222222)
    layout = master
}

decoration {
    rounding = 8
    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = false
}

bindr = SUPER, SUPER_L, exec, bemenu-run -l 7
bind = SUPER, RETURN, exec, alacritty
bind = SUPER, C, killactive, 
bind = SUPER SHIFT, C, exit, 
bind = SUPER, W, togglefloating, 

bind = SUPER, 1, workspace, 1
bind = SUPER, 2, workspace, 2
bind = SUPER, 3, workspace, 3
bind = SUPER, 4, workspace, 4
bind = SUPER, 5, workspace, 5
bind = SUPER, 6, workspace, 6
bind = SUPER, 7, workspace, 7
bind = SUPER, 8, workspace, 8
bind = SUPER, 9, workspace, 9
bind = SUPER, 0, workspace, 10

bind = SUPER SHIFT, 1, movetoworkspace, 1
bind = SUPER SHIFT, 2, movetoworkspace, 2
bind = SUPER SHIFT, 3, movetoworkspace, 3
bind = SUPER SHIFT, 4, movetoworkspace, 4
bind = SUPER SHIFT, 5, movetoworkspace, 5
bind = SUPER SHIFT, 6, movetoworkspace, 6
bind = SUPER SHIFT, 7, movetoworkspace, 7
bind = SUPER SHIFT, 8, movetoworkspace, 8
bind = SUPER SHIFT, 9, movetoworkspace, 9
bind = SUPER SHIFT, 0, movetoworkspace, 10

bindm = SUPER, mouse:272, movewindow
bindm = SUPER, mouse:273, resizewindow

binde = , XF86AudioRaiseVolume, exec, pamixer -i 1
binde = , XF86AudioLowerVolume, exec, pamixer -d 1

bind = , PRINT, exec, grimblast --freeze copy area

exec-once = hyprpaper
exec-once = waybar
''
