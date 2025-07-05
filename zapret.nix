{
  lib,
  config,
  pkgs,
  ...
}@args:
let
  pluglib = import ./lib.nix args;
  cfg = config.plug.zapret;
  inherit (lib) mkDefault;
in
{
  options.plug.zapret = {
    enable = lib.mkEnableOption "zapret";
  };

  config = pluglib.mkIf cfg.enable {
    services.zapret = {
      enable = true;
      params = mkDefault [
        "--dpi-desync=multidisorder --dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1 --new"
        "-dpi-desync=multidisorder --dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1 --new"
        "--dpi-desync=fake --dpi-desync-ttl=2"
      ];
    };
    environment.systemPackages = [ pkgs.zapret ];
  };
}
