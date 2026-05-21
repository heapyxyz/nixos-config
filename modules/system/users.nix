{ pkgs, ... }:

{
  users.users.heapy = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "heapy";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
