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
    "gtk-3.0" = {
      source = link "gtk-3.0";
      force = true;
    };
    "gtk-4.0" = {
      source = link "gtk-4.0";
      force = true;
    };
  };
}
