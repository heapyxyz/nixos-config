{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (obs-studio.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        wrapProgram $out/bin/obs --set QT_QPA_PLATFORM xcb --add-flags --startreplaybuffer
      '';
    }))
  ];
}
