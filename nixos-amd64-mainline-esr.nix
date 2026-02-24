{ config, pkgs, lib, ... }:

{
	boot.kernelPackages = pkgs.linuxPackages;
	# non credendo che sia necessario
	# boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
	zramSwap.enable = true;
}
