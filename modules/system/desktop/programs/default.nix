{ pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./gnome.nix
    ./openlogi.nix
    ./overlays.nix
    ./starship.nix
    ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
    # apps
    brave
    equibop
    ghostty
    heroic
    obs-studio
    pgadmin4-desktopmode
    prismlauncher
    telegram-desktop
    termius
    vscode-fhs

    # coding
    clang-tools
    dotnet-sdk_10
    nodejs_26
    pnpm
    python314

    # nix lsp
    nixd
    nixfmt

    # other
    apple-cursor
    mangohud
    steam-run
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
    NIXOS_OZONE_WL = "1";
  };
}
