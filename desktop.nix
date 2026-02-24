{ config, pkgs, ...}:

{
	services.xserver.enable = true;
	services.xserver.displayManager.startx.enable = true;
	services.xserver.displayManager.lightdm.enable = true;
	services.xserver.displayManager.lightdm.greeters.lomiri.enable = false;
	services.xserver.desktopManager.xterm.enable = true;
	services.xserver.windowManager.jwm.enable = true;
	services.xserver.desktopManager.xfce.enable = true;
	services.desktopManager.lomiri.enable = true;

	environment.systemPackages = with pkgs; [ vim emacs wget sshfs w3m mc dosbox stdenv gcc gdb gnumake binutils pkg-config automake autoconf git jwm xbill firefox chromium file btop audacious mpv gimp libreoffice qemu remmina x11vnc debootstrap pciutils weston ];

	services.xserver.xkb.layout = "us";
	services.xserver.xkb.options = "eurosign:e,caps:escape";

	services.pipewire.enable = true;
	services.pipewire.pulse.enable = true;
}
