{ config, pkgs, lib, ... }:

{
	boot.kernelPackages = pkgs.linuxPackages;
	boot.binfmt.emulatedSystems = [ "x86_64-linux" "i686-linux" ];
	zramSwap.enable = true;
}
