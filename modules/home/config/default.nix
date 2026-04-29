{ config, flake-dir, ... }:
let
  link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/config/${f}";
in
{
  xdg.configFile = {
    "ghostty" = {
      source = link "ghostty";
      force = true;
    };
    "cinnamon" = {
      source = link "cinnamon";
      force = true;
    };
  };
}
