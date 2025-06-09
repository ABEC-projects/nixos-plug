{ lib, config, ... }@args:
let
  cfg = config.plug.sway;
  pluglib = import ./lib.nix args;
in
{
  options.plug.sway = {
    enable = lib.mkEnableOption "sway";
  };

  config = pluglib.mkIf cfg.enable {
    programs.sway.enable = true;
  };
}
