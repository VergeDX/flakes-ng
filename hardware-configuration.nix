# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/D8F2-F6CB";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/e03e0ab5-1871-425c-a9ae-801fa68ef45c";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/persistent" =
    {
      device = "/dev/disk/by-uuid/e03e0ab5-1871-425c-a9ae-801fa68ef45c";
      fsType = "btrfs";
      options = [ "subvol=persistent" ];
    };

  fileSystems."/etc/nixos" =
    {
      device = "/persistent/persistent/Projects/flakes-ng";
      fsType = "none";
      options = [ "bind" ];
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/1b07ef58-fa1b-4e5e-a394-7a07a9229f07"; }];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
