{ inputs, ... }: with inputs;
{
  imports = [ impermanence.nixosModules.home-manager.impermanence ]
    ++ [ ./impermanence.nix ];
  home.stateVersion = "21.11";
}
