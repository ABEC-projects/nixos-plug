{
  lib,
  config,
  options,
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
  ];

  options.plug.enable = lib.mkEnableOption "plug";

  config = lib.mkIf config.plug.enable {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    assertions = [ ];
  };
}
