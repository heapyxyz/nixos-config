{ ... }:

{
  users.users.heapy = {
    isNormalUser = true;
    description = "heapy";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
