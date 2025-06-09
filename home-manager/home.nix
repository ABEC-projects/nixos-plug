{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./sway.nix
  ];
    
  config = {
    home.packages = [
    ];


    programs.tmux = {
      enable = true;
      shortcut = "s";
      baseIndex = 1;
      mouse = true;
      newSession = true;
      extraConfig = (builtins.readFile ./dotfiles/tmux/tmux.conf);
    };

    home.stateVersion = "25.05";
  };
}
