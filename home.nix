{ inputs, ... }: with inputs;
{
  imports = [ impermanence.nixosModules.home-manager.impermanence ];
  home.stateVersion = "21.11";
}
