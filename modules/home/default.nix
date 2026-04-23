{ ... }:

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
  };
}
