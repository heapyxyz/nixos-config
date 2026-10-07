{ inputs, ... }:

{
  nixpkgs.overlays = [
    # mactahoe-icon-theme package for home-manager (/modules/home/default.nix)
    (final: prev: {
      mactahoe-icon-theme = final.callPackage ../packages/mactahoe.nix {
        mactahoe-src = inputs.mactahoe-src;
      };
    })
    # run obs in wayland, start with replay buffer enabled
    (final: prev: {
      obs-studio = prev.obs-studio.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          wrapProgram $out/bin/obs --set QT_QPA_PLATFORM xcb --add-flags --startreplaybuffer
        '';
      });
    })
  ];
}
