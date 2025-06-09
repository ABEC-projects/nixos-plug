{ lib, config, osConfig, pkgs, ...}@args:
let
  pluglib = import ./lib.nix args;
  mod = "Mod4";
  keyb = {
          "${mod}+Return" = "exec ${pkgs.kitty}/bin/kitty";
          "${mod}+space" = "exec ${pkgs.wofi}/bin/wofi --show drun";
          "${mod}+Mod1+r" = "reload";
          "${mod}+Shift+e" =  "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";


          "${mod}+Shift+q" = "kill";
          "${mod}+F3" = "exec mpc volume '-1'";
          "${mod}+F4" = "exec mpc volume '+1'";
          "${mod}+F5" = "exec mpc prev";
          "${mod}+F6" = "exec mpc toggle";
          "${mod}+F7" = "exec mpc next";

          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+Mod1+h" = "split h";
          "${mod}+v" = "split v";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+w" = "layout tabbed";
          "${mod}+r" = "layout toggle spleet";

          "${mod}+Shift+space" = "floating toggle";
          "${mod}+colon" = "focus mode_toggle";
          "${mod}+a" = "focus parent";
          "${mod}+z" = "focus child";
          
          "${mod}+Shift+r" = "resize";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

        };
in
{
  config = pluglib.mkIf osConfig.plug.sway.enable {
    home.packages = with pkgs; [
      swaybg
    ];
    wayland.windowManager.sway = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/sway/config;
      config = {
        modifier = mod;
        keybindings = keyb;
        input = {
          "*" = {
            xkb_layout = "us,ru";
            xkb_options = "grp:alt_shift_toggle";
            repeat_rate = "40";
            repeat_delay = "300";
          };
          "type:touchpad" = {
            dwt = "enabled";
            tap = "enabled";
            middle_emulation = "enabled";
            natural_scroll = "enabled";
          };
        };
      };
    };
    programs.swaylock.enable = true;
  };
}
