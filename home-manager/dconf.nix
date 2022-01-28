{ ... }:
{
  # Credit: Ninlives/nixos-config - home-in-details/misc/gnome.nix
  dconf.settings = {
    "org/gnome/shell".welcome-dialog-last-shown-version = "40.1";
  };
}
