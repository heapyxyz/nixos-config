{
  config,
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

      # https://github.com/vinceliuice/MacTahoe-icon-theme
      # used icons from the main branch because latest release isn't up-to-date
      ".local/share/icons/MacTahoe" = {
        source = link "icons/MacTahoe";
        force = true;
      };
      ".local/share/icons/MacTahoe-dark" = {
        source = link "icons/MacTahoe-dark";
        force = true;
      };
      ".local/share/icons/MacTahoe-dark-bold" = {
        source = link "icons/MacTahoe-dark-bold";
        force = true;
      };
    };
  };
}
