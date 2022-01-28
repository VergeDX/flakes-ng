{ inputs, config, ... }: with inputs;
{
  imports = [ impermanence.nixosModules.home-manager.impermanence ]
    ++ [ ./impermanence.nix ./dconf.nix ];

  home.file.".config/nixpkgs".source =
    config.lib.file.mkOutOfStoreSymlink
      "/home/vanilla/Projects/flakes-ng/home-manager";

  home.stateVersion = "21.11";
}
