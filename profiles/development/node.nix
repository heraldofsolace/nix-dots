{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.nodejs_latest pkgs.yarn];

  # Run locally installed bin-script, e.g. n coffee file.coffee
  environment.shellAliases = {
    noderun = ''PATH="$(${pkgs.nodejs_latest}/bin/npm bin):$PATH"'';
    ya = "yarn";
  };
}
