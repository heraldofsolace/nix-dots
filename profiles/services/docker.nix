{
  config,
  lib,
  pkgs,
  ...
}: {
  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
      enableOnBoot = true;
      # listenOptions = [];
    };
  };
}
