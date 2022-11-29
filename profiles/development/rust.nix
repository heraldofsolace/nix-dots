{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.rustup];
  environment.shellAliases = {
    rs = "rustc";
    rsp = "rustup";
    ca = "cargo";
  };
}
