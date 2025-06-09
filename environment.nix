{
  config,
  pkgs,
  lib,
  ...
}@inputs:
let
  pluglib = import ./lib.nix inputs;
  guiApps = with pkgs; [
    obsidian
    libreoffice
    kitty
    feh
    keepassxc
    pavucontrol
    gtk4
    gtk3
    gtk2
  ];
in
{
  options.plug.machineType = lib.mkOption {
    type =
      with lib.types;
      (unique { message = "Only one machineType can be selected"; } (
        nullOr (enum [
          "main_pc"
          "laptop"
          "server"
        ])
      ));
    default = null;
    description = ''
      Defines which options to enable by default.
    '';
  };

  config = lib.mkMerge [
    {
      environment.variables = { EDITOR = "nvim"; TERMINAL = "kitty"; };
    }
    (pluglib.mkIf config.plug.enable {
      environment.systemPackages = with pkgs; [
        fd
        ripgrep
        gh
        neovim
        helix
        fish
        maestral
        tmux
        bashmount
        sqlite
        yazi
        maestral
        nil
        lsd
        bluetui
        pavucontrol
        zig
        nixd
        nixfmt-rfc-style
        sshfs
      ];
    })
    (pluglib.mkIf (config.plug.machineType != "server") {
      environment.systemPackages =
        with pkgs;
        builtins.concatLists [
          guiApps
        ];
    })
  ];
}
