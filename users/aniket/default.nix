{
  self,
  pkgs,
  hmUsers,
  config,
  ...
}: {
  home-manager.users = {inherit (hmUsers) aniket;};

  age.secrets.aniket.file = "${self}/secrets/aniket.age";
  users.users.aniket = {
    passwordFile = "/run/agenix/aniket";
    description = "Aniket Bhattacharyea";
    isNormalUser = true;
    uid = 1000;
    extraGroups = ["wheel" "docker" "networkmanager" "plugdev" "i2c" "vboxusers" "scanner" "lp" ];
    shell = pkgs.bash; # bash as default shell to keep myself sane. In interactive mode, bash drops into fish
  };
}
