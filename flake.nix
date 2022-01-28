{
  inputs = {
    nixos-stable.url = "github:nixos/nixpkgs/nixos-21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, ... }@inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system: {
      packages = {
        nixosConfigurations."NixOS-RoT" = nixos-stable.lib.nixosSystem rec {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
    });
}
