{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # open ports for Source Dedicated Server hosting
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [ apple-cursor ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];

    protontricks.enable = true;
  };

  programs.gamemode.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true;
    enableWsi = true;
  };
}
