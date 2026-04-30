#!/usr/bin/env bash

# app-picker-layout causes dconf2nix to fail, so just delete it
nix-shell -p dconf2nix --run "
    dconf dump /org/gnome/ > gnome_dump.txt && \
    sed -i '/app-picker-layout/d' gnome_dump.txt && \
    dconf2nix -i gnome_dump.txt -o gnome_dump.nix
"
rm gnome_dump.txt