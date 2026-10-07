{ inputs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      mactahoe-icon-theme = final.callPackage ../packages/mactahoe.nix {
        mactahoe-src = inputs.mactahoe-src;
      };
    })
    (final: prev: {
      obs-studio = prev.obs-studio.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          wrapProgram $out/bin/obs --set QT_QPA_PLATFORM xcb --add-flags --startreplaybuffer
        '';
      });
    })
  ];
}
