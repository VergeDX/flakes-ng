{
  inputs = {
    nixos-stable.url = "github:nixos/nixpkgs/nixos-21.11";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager/release-21.11";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixos-unstable";

    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = { self, ... }@inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system: {
      packages = {
        nixosConfigurations."NixOS-RoT" = nixos-stable.lib.nixosSystem rec {
          inherit system;
          modules = [ ./configuration.nix ] ++ [
            home-manager.darwinModules.home-manager
            { home-manager.users."vanilla" = import ./home.nix; }
          ] ++ [{ home-manager.extraSpecialArgs = { inherit inputs; }; }];
        };
      };
    });
}
