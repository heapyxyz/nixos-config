{ inputs, ... }:

{
  nixpkgs.overlays = [
    # start with replay buffer enabled
    (final: prev: {
      obs-studio = prev.obs-studio.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          wrapProgram $out/bin/obs --add-flags --startreplaybuffer
        '';
      });
    })
    # apple-cursor custom package that works on gnome 51 (i love gnome)
    inputs.nix-additional.overlays.apple-cursor
    # latest version of blur-my-shell gnome extension
    inputs.nix-additional.overlays.blur-my-shell
    # mactahoe-icon-theme package for home-manager
    inputs.nix-additional.overlays.mactahoe-icon-theme
  ];
}
