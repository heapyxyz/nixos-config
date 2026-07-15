{
  inputs,
  flake-dir,
  hostname,
  username,
  background,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/desktop
  ];

  services.udev.extraRules = ''
    # prevent udisks auto-mount
    ENV{ID_FS_UUID}=="2E366D0D366CD77D", ENV{UDISKS_IGNORE}="1"
  '';

  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        flake-dir
        hostname
        username
        background
        ;
    };

    users.${username} = import ../../modules/home;
  };
}
