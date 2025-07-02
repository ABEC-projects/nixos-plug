{ lib, config, pkgs, ... }@args:
let
  pluglib = import ./lib.nix args;
  cfg = config.plug.zapret;
in
{
  options.plug.zapret = {
    enable = lib.mkEnableOption "zapret";
  };

  config = pluglib.mkIf cfg.enable {
    services.zapret = { 
      enable = true;
      params = [];
    };
    environment.systemPackages = [ pkgs.zapret ];
  };
}
