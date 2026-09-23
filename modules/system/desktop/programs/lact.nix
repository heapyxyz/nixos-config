{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lact
  ];

  systemd.packages = with pkgs; [
    lact
  ];

  systemd.services.lact.enable = true;
}
