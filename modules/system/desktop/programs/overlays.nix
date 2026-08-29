{ inputs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      mactahoe-icon-theme = final.callPackage ../packages/mactahoe.nix {
        mactahoe-src = inputs.mactahoe-src;
      };
    })
  ];
}
