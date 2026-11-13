{ inputs, ... }:

{
  nixpkgs.overlays = [
    # mactahoe-icon-theme package for home-manager (/modules/home/default.nix)
    (final: prev: {
      mactahoe-icon-theme = final.callPackage ../packages/mactahoe.nix {
        mactahoe-src = inputs.mactahoe-src;
      };
    })
    # apple-cursor custom package that works on gnome 51 (i love gnome)
    (final: prev: {
      apple-cursor = final.callPackage ../packages/apple-cursor.nix { };
    })
    # run obs in wayland, start with replay buffer enabled
    (final: prev: {
      obs-studio = prev.obs-studio.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          wrapProgram $out/bin/obs --set QT_QPA_PLATFORM xcb --add-flags --startreplaybuffer
        '';
      });
    })
    # latest version of blur-my-shell gnome extension
    inputs.nix-additional.overlays.blur-my-shell
  ];
}
