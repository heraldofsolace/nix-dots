{
  self,
  suites,
  lib,
  inputs,
  ...
}: {
  imports = [./hardware-configuration.nix inputs.grub2-themes.nixosModules.default] ++ suites.horologium;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-ac0722b1-35f7-4b31-a215-942322657a7c".device = "/dev/disk/by-uuid/ac0722b1-35f7-4b31-a215-942322657a7c";
  boot.initrd.luks.devices."luks-ac0722b1-35f7-4b31-a215-942322657a7c".keyFile = "/crypto_keyfile.bin";

  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.copyKernels = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.enableCryptodisk = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.device = "nodev";

  boot.loader.grub2-theme = {
    enable = true;
    theme = "tela";
    screen = "2k";
    footer = true;
  };

  environment.variables = {
    EDITOR = "vim";
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  services.xserver = {
    enable = true;
    wacom.enable = true;
    videoDrivers = ["amdgpu"]; # Need a way to change this for different hosts
  };

  services.geoclue2.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  system.configurationRevision = lib.mkIf (self ? rev) self.rev;
  system.stateVersion = "22.05";
}
