{ pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./gnome.nix
    ./obs-studio.nix
    ./overlays.nix
    ./starship.nix
    ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
    # apps
    brave-origin
    equibop
    dbgate
    ghostty
    ghidra-bin
    heroic
    prismlauncher
    shotcut
    telegram-desktop
    termius
    unityhub
    vscode-fhs

    # coding
    clang-tools
    dotnet-sdk_10
    nodejs_26
    openjdk21
    pnpm
    pyright
    python314

    # nix stuff
    nixd
    nixfmt

    # other
    mangohud
    steam-run
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
  };

  services.lact.enable = true;
}
