{ config, flake-dir, ... }:
let
  link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/config/${f}";
in
{
  xdg.configFile = {
    "ghostty/config.ghostty" = {
      source = link "ghostty/config.ghostty";
      force = true;
    };
  };
}
