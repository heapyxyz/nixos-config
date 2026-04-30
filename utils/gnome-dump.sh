#!/usr/bin/env bash

nix-shell -p dconf2nix --run "dconf dump /org/gnome/ > gnome_dump.txt | dconf2nix > gnome_dump.nix"