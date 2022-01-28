{ ... }:
{
  fileSystems = {
    "/" = { fsType = "tmpfs"; options = [ "defaults" "size=2G" "mode=755" ]; };
    "/boot" = { device = "/dev/disk/by-uuid/D8F2-F6CB"; fsType = "vfat"; };
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/e03e0ab5-1871-425c-a9ae-801fa68ef45c";
    fsType = "btrfs";
    options = [ "subvol=nix" "noatime" "compress-force=zstd" ];
  };

  fileSystems."/persistent" = {
    device = "/dev/disk/by-uuid/e03e0ab5-1871-425c-a9ae-801fa68ef45c";
    fsType = "btrfs";
    options = [ "subvol=persistent" "noatime" "compress-force=zstd" ];
    neededForBoot = true;
  };

  environment.etc."nixos".source = "/home/vanilla/Projects/flakes-ng";
}
