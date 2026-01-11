{ nixpkgs, lib, apple-silicon, ... }:

{
	config = {
		hardware.asahi.extractPeripheralFirmware = true; # Disabilitare in caso di mancanza archivi firmware in /boot/asahi
		hardware.asahi.peripheralFirmwareDirectory = "/boot/asahi";
		zramSwap.enable = true;
		nix = {
			settings.extra-substituters = [ "https://nixos-apple-silicon.cachix.org" ];
			settings.extra-trusted-public-keys = [ "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qa0zMy5UT292TxeEPzIz8VVEr2Js20=" ];
		};
	};
}
