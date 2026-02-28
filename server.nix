{ config, lib, pkgs, ... }:

{
	# List services that you want to enable:

	# Servizio SMB
	services.samba.enable = true;

	# Servizio Cron
	services.cron.enable = true;

	# Enable the Nginx Web Server.
	services.nginx.enable = true;

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;
	# SIA RASA AL SUOLO LA FAMIGLIA DI CHI HA SPECIFICATO prohibit-password DI DEFAULT
	services.openssh.settings.PermitRootLogin = "no";

	# Facoltativi
	environment.systemPackages = with pkgs; [ 
	# server VNC
	# turbovnc
	w3m vim mc wget stdenv gcc gdb gnumake binutils pkg-config automake autoconf git htop btop ];

	# Abilita tutta questa merda per un'esperienza desktop remota
	# Utilizzo turboVNC perché caricabile e configurabile dall'utente anche
	# con tunnel SSH
	services.xserver.enable = false;
	services.xserver.displayManager.startx.enable = false;
	services.xserver.desktopManager.xfce.enable = false;
	# Come prima
	fonts.fontconfig.enable = false;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;
}
