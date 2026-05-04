{ config, flake-dir, ... }:
let
  link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/configs/${f}";
in
{
  xdg.configFile = {
    "ghostty" = {
      source = link "ghostty";
      force = true;
    };
  };
}
