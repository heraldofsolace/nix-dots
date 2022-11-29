{
  self,
  suites,
  lib,
  ...
}: {
  imports = [./hardware-configuration.nix ./zfs.nix] ++ suites.andromeda;

  environment.variables = {
    EDITOR = "vim";
  };

  environment.persistence."/persist".hideMounts = true;
  environment.persistence."/persist".directories = [
    "/etc/nix"
    "/root"
  ];
  environment.persistence."/persist".files = [
    "/etc/machine-id"
  ];
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
    hostKeys = [
      {
        path = "/persist/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
      {
        path = "/persist/etc/ssh/ssh_host_rsa_key";
        type = "rsa";
        bits = 4096;
      }
    ];
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
