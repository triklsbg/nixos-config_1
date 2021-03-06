# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

let 
  # Mount options for external storage drives that could be missing during boot
  externalMountOptions = [
    "noatime"
    "nofail"
    "x-systemd.device-timeout=5"
  ];
in
{
  boot = {
    tmpOnTmpfs = true;
    loader = {
      timeout = 15;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        memtest86.enable = true;
      };
    };

    kernel.sysctl = {
      "kernel.sysrq" = 438;
    };
    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_latest;

    initrd = {
      availableKernelModules = [ "ahci" "nvme" "usbhid" ];
      luks.devices."luks-9ebe5c59-eac5-47eb-b517-c82f2ede2ca3" = {
        device = "/dev/disk/by-uuid/9ebe5c59-eac5-47eb-b517-c82f2ede2ca3";
	allowDiscards = true;
      };
    };
  };

  fileSystems = {
    "/" = { 
      device = "/dev/disk/by-uuid/4a5edb30-f86b-4ec3-a493-8de48c8ee703";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };
    "/home" = { 
      device = "/dev/disk/by-uuid/4a5edb30-f86b-4ec3-a493-8de48c8ee703";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };
    "/tmp" = { 
      device = "tmpfs";
      fsType = "tmpfs";
    };
    "/boot" = { 
      device = "/dev/disk/by-uuid/5C3B-A244";
      fsType = "vfat";
    };
    "/mnt/bcache" = {
      device = "/dev/disk/by-uuid/fe06889b-37fe-4252-ba03-84ca1ae57264";
      fsType = "ext4";
      options = externalMountOptions;
    };
    # "/mnt/broken" = {
    #   device = "/dev/disk/by-uuid/c4ee3208-f668-41ab-92d3-a4158a41fe18";
    #   fsType = "ext4";
    #   options = externalMountOptions;
    # };
    "/mnt/hitachi" = { 
      device = "/dev/disk/by-uuid/0c21a12f-488e-41f2-bd92-3a8ef4db020e";
      fsType = "ext4";
      options = externalMountOptions;
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/c84a09e7-8889-4c45-a6f5-0a39dcdb031f";
      randomEncryption.enable = true;
    }
  ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
}
