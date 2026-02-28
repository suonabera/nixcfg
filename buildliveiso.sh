#!/bin/sh
sudo nix build .#nixosConfigurations.nixos-amd64-mainline-esr-live.config.system.build.isoImage --extra-experimental-features "nix-command flakes"
