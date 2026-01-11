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

	services.xserver.xkb.layout = "us";
	services.xserver.xkb.options = "eurosign:e,caps:escape";

	services.pipewire.enable = true;
	services.pipewire.pulse.enable = true;
}
