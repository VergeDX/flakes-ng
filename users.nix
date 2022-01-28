{ pkgs, ... }:
{
  users.mutableUsers = false;
  users.defaultUserShell = pkgs.fish;

  users.users."vanilla" = {
    isNormalUser = true;
    hashedPassword = "$6$rootfs/on/tmpfs$ZdJgQnzRONBdzI0TKoRaXVf5jgvWZMfZL4faLLc1ACMtHuTTzEogZhyBLKB6MsWztkSC6FHygH.6O/o37Pd1p0";
    extraGroups = [ "wheel" ];
  };
}
