{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

# gnome 51 draws cursors from cursors_scalable/ which apple-cursor does not ship
# use custom repo with svgs shipped
stdenvNoCC.mkDerivation {
  pname = "apple-cursor";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "Neutrovertido";
    repo = "macOS-monterey-cursor";
    rev = "fcf35ea8498318cd4736c644ad0cb4b9ccfb21f1";
    hash = "sha256-l7U9u7CLCIJRRuapGFR67ADN9vzk0KUJZLTnf/xGzpE=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    # rename to "macOS" (original apple-cursor package uses it)
    cp -r macOS-Monterey $out/share/icons/macOS
    runHook postInstall
  '';

  meta = {
    description = "macOS cursors";
    homepage = "https://github.com/Neutrovertido/macOS-monterey-cursor";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
}
