{ pkgs, username, ... }:

{
  users = {
    users.${username} = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = username;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };

    defaultUserShell = pkgs.zsh;
  };
}
