{ config, flake-dir, ... }:
let
  link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/${f}";
in
{
  imports = [
    ./config
  ];

  home = {
    username = "heapy";
    homeDirectory = "/home/heapy";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;

    # make ghostty default terminal
    sessionVariables = {
      TERMINAL = "ghostty";
    };

    file.".local/share/backgrounds/background.jpg".source = link "background.jpeg";
  };
}
