{
  config,
  pkgs,
  flake-dir,
  username,
  ...
}:

let
  link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/${f}";
in
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

    file = {
      ".local/share/backgrounds" = {
        source = link "backgrounds";
        force = true;
      };
    };

    packages = [ pkgs.mactahoe-icon-theme ];
  };
}
