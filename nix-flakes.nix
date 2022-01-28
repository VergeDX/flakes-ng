{ pkgs, ... }:
{
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = "experimental-features = nix-command flakes";

  programs.git.enable = true;
  programs.git.config = {
    user.name = "Vanilla";
    user.email = "osu_Vanilla@126.com";
  };
}
