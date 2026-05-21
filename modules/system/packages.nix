{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    apple-cursor
    brave
    btop
    clang-tools
    docker-compose
    equibop
    fastfetch
    git
    gh
    ghostty
    nixfmt
    nodejs_25
    pnpm
    telegram-desktop
    termius
    steam-run
    wget
    vscode-fhs
  ];

  fonts.packages = with pkgs; [
    inter
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting

    extraPackages = with pkgs; [ apple-cursor ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  services.cloudflare-warp.enable = true;
}
