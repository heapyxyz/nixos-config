{
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./configs
  ];

  fonts.fontconfig.enable = true;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;

    # make ghostty default terminal
    sessionVariables = {
      TERMINAL = "ghostty";
    };

    packages = [ pkgs.mactahoe-icon-theme ];
  };
}
