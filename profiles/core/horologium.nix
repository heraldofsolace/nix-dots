{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./common.nix];
  environment.systemPackages = with pkgs; [
    xdotool
    # easystroke
    # cellwriter
    # cellwriter-sh
    maliit-keyboard
    maliit-framework
  ];
}
