{ config, lib, pkgs, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	networking.hostName = "nixos-aarch64-apple-silicon";

	nix.settings.substitute = true; # false = modalita' gentoo
	nix.settings.sandbox = false;
	nix.settings.filter-syscalls = false;

	# Use the Limine EFI boot loader.
	boot.loader.limine.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Configure network connections interactively with nmcli or nmtui.
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/Rome";

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocales = [ "it_IT.UTF-8/UTF-8" ];
	# console = {
	#   font = "Lat2-Terminus16";
	#   keyMap = "us";
	#   useXkbConfig = true; # use xkb.options in tty.
	# };

	# Enable CUPS to print documents.
	# services.printing.enable = true;

	# Enable touchpad support (enabled default in most desktopManager).
	# services.libinput.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.enrico = {
		isNormalUser = true;
		extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
		#packages = with pkgs; [ ];
	};

	environment.systemPackages = with pkgs; [ vim emacs wget sshfs w3m mc dosbox stdenv gcc gdb gnumake binutils pkg-config automake autoconf git jwm xbill firefox chromium file btop audacious mpv gimp libreoffice qemu remmina x11vnc debootstrap pciutils weston ];

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# Copy the NixOS configuration file and link it from the resulting system
	# (/run/current-system/configuration.nix). This is useful in case you
	# accidentally delete configuration.nix.
	# system.copySystemConfiguration = true;

	#system.stateVersion = "25.11"; # man configuration.nix

}
