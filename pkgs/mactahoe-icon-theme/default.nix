{
  stdenvNoCC,
  lib,
  gtk3,
  jdupes,
  hicolor-icon-theme,
  mactahoe-src,
}:

stdenvNoCC.mkDerivation {
  pname = "mactahoe-icon-theme";
  version = "unstable-${mactahoe-src.lastModifiedDate}";

  dontFixup = true;

  src = mactahoe-src;

  nativeBuildInputs = [
    gtk3
    jdupes
  ];

  propagatedBuildInputs = [ ];

  installPhase = ''
    runHook preInstall

    # install base themes
    bash install.sh -d $out/share/icons -n MacTahoe

    # remove unwanted inheritance
    for theme in "$out/share/icons"/*; do
      sed -i 's/Inherits=.*/Inherits=/' "$theme/index.theme"
    done

    # update icon cache on all themes
    for theme in "$out/share/icons"/*; do
      gtk-update-icon-cache "$theme"
    done

    runHook postInstall
  '';

  meta = {
    description = "MacOS icon theme for Linux";
    homepage = "https://github.com/vinceliuice/MacTahoe-icon-theme";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
}
