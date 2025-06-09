{lib, config, pkgs, ...}@inputs: 
let
  cfg = config.plug.stylix;
  pluglib = import ./lib.nix inputs;
in
{
  options.plug.stylix = {
    enable = lib.mkEnableOption "stylix";
  };

  config = pluglib.mkIf cfg.enable {
    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    stylix.image = ./assets/MikuDarkBg.jpg;
    stylix.polarity = "dark";
  };
}
