{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ripcord
    discord
    zoom-us
    slack
  ];
}
