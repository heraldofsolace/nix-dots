{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.grub2-themes.nixosModules.default];

  boot.supportedFilesystems = ["zfs"];
  networking.hostId = "ab16568e";
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.generationsDir.copyKernels = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.copyKernels = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.zfsSupport = true;

  boot.loader.grub.extraPrepareConfig = ''
    mkdir -p /boot/efis
    for i in  /boot/efis/*; do mount $i ; done

    mkdir -p /boot/efi
    mount /boot/efi
  '';

  boot.loader.grub.extraInstallCommands = ''
    ESP_MIRROR=$(mktemp -d)
    cp -r /boot/efi/EFI $ESP_MIRROR
    for i in /boot/efis/*; do
      cp -r $ESP_MIRROR/EFI $i
    done
    rm -rf $ESP_MIRROR
  '';

  boot.loader.grub.devices = [
    "/dev/disk/by-id/nvme-Seagate_FireCuda_520_SSD_ZP1000GM30002_7QG021QD"
    "/dev/disk/by-id/ata-ST1000DM010-2EP102_ZN10JDQ3"
  ];

  boot.loader.grub2-theme = {
    enable = true;
    theme = "tela";
    screen = "2k";
    footer = true;
  };

  services.zfs = {
    autoScrub.enable = true;
    autoSnapshot.enable = true;
    # TODO: autoReplication
  };
  systemd.services.zfs-mount.enable = false;

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r rpool/local/root@blank
  '';
}
