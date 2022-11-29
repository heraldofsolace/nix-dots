{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gcc
    bear
    gdb
    cmake
  ];
}
