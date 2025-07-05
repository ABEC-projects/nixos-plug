{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./users.nix
    ./environment.nix
    ./wireless.nix
    ./terminal-apps.nix
    ./music.nix
    ./intercept.nix
    ./swap.nix
    ./locales.nix
    ./stylix.nix
    ./sway.nix
    ./zapret.nix
    ./i3.nix
    ./yazi.nix
    ./xserver.nix
    ./hibernation.nix
  ];

  options.plug.enable = lib.mkEnableOption "plug";

  config = lib.mkIf config.plug.enable {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
