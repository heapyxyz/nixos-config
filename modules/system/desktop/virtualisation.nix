{ pkgs, username, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };

    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    spice-gtk
    virtio-win
  ];

  users.users.${username}.extraGroups = [ "libvirtd" ];
}
