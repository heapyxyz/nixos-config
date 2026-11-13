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

    packages = with pkgs; [ mactahoe-icon-theme ];

    pointerCursor = {
      enable = true;
      name = "macOS";
      size = 24;
      package = pkgs.apple-cursor;
    };
  };
}
