{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [rnix-lsp];
}
