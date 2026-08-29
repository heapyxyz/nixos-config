{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # 64-bit
      stdenv.cc.cc.lib
      glibc
      zlib

      # 32-bit
      pkgsi686Linux.stdenv.cc.cc.lib
      pkgsi686Linux.glibc
      pkgsi686Linux.zlib
    ];
  };
}
