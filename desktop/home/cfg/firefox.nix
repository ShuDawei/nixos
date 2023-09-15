{ ... }:

{
    programs.firefox = {
        enable = true;
        profiles.default.userChrome = ''
            /* Hide Tab bar with only one Tab - [110] */
            #tabbrowser-tabs .tabbrowser-tab:only-of-type,
            #tabbrowser-tabs .tabbrowser-tab:only-of-type + #tabbrowser-arrowscrollbox-periphery{
                display:none !important;
            }
            #tabbrowser-tabs, #tabbrowser-arrowscrollbox {min-height:0!important;}
            /* #TabsToolbar:not(:hover) */ #alltabs-button {display:none !important;}
        '';
    };
}
