{ config, pkgs, ...}:

{
	services.xserver.enable = true;
	services.xserver.displayManager.startx.enable = true;
	services.xserver.displayManager.lightdm.enable = true;
	services.xserver.displayManager.lightdm.greeters.lomiri.enable = false;
	services.xserver.desktopManager.xterm.enable = true;
	services.xserver.windowManager.jwm.enable = false;
	services.xserver.desktopManager.xfce.enable = true;
	services.desktopManager.lomiri.enable = false;

	fonts.fontconfig.enable = true; # ???? perché devo impostarlo a mano?

	environment.systemPackages = with pkgs; [ vim wget sshfs w3m mc dosbox stdenv gcc gdb gnumake binutils pkg-config automake autoconf git xbill firefox file btop htop mpv gimp libreoffice qemu remmina x11vnc debootstrap pciutils gparted ];

	services.xserver.xkb.layout = "us";
	services.xserver.xkb.options = "eurosign:e,caps:escape";

	services.pipewire.enable = true;
	services.pipewire.pulse.enable = true;
}
