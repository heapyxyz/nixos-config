{ pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./gnome.nix
    ./lact.nix
    ./obs.nix
    ./openlogi.nix
    ./overlays.nix
    ./starship.nix
    ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
    # apps
    brave
    davinci-resolve
    equibop
    ghostty
    heroic
    pgadmin4-desktopmode
    prismlauncher
    telegram-desktop
    termius
    unityhub
    vscode-fhs

    # coding
    clang-tools
    dotnet-sdk_10
    nodejs_26
    pnpm
    python314

    # nix stuff
    nixd
    nixfmt

    # other
    apple-cursor
    mangohud
    steam-run
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
  };
}
