{ lib, config, ... }: {
  mkIf = cond: lib.mkIf (config.plug.enable && cond);
}
