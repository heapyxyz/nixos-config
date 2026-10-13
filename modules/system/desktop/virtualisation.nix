{ pkgs, username, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        vhostUserPackages = with pkgs; [ virtiofsd ];
      };
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
