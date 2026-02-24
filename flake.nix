{
	description = "Jai hind NixOS config for mido #1 hindi download free";
	inputs = {
		nixpkgs = { url = "github:suonabera/nixpkgs/nixos-25.11"; };
		apple-silicon = { url = "github:nix-community/nixos-apple-silicon"; inputs.nixpkgs.follows = "nixpkgs"; };
	};
	outputs = { apple-silicon, ... }@inputs: { nixosConfigurations = {
			nixos-aarch64-mainline-esr-desktop = inputs.nixpkgs.lib.nixosSystem {
				system = "aarch64-linux";
				modules = [
					./nixos-aarch64-mainline-esr.nix
					./desktop.nix
					./configuration.nix
				];
			};
			nixos-aarch64-apple-silicon-desktop = inputs.nixpkgs.lib.nixosSystem {
				system = "aarch64-linux";
				specialArgs = {
					inherit apple-silicon;
				};
				modules = [
					./nixos-aarch64-apple-silicon.nix
					apple-silicon.nixosModules.apple-silicon-support
					./desktop.nix
					./configuration.nix
				];
			};
			nixos-amd64-mainline-esr-server = inputs.nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./nixos-amd64-mainline-esr.nix
					./configuration.nix
					./server.nix
				];
			};
		};
	};
}
