{
  pkgs,
  extraModulesPath,
  inputs,
  lib,
  ...
}: let
  inherit
    (pkgs)
    agenix
    cachix
    editorconfig-checker
    mdbook
    nixUnstable
    treefmt
    nvfetcher-bin
    alejandra
    nodePackages
    shellcheck
    shfmt
    ;

  hooks = import ./hooks;

  pkgWithCategory = category: package: {inherit package category;};
  devos = pkgWithCategory "devos";
  linter = pkgWithCategory "linter";
  docs = pkgWithCategory "docs";
in {
  _file = toString ./.;

  imports = ["${extraModulesPath}/git/hooks.nix"];
  git = {inherit hooks;};

  commands =
    [
      (devos nixUnstable)
      (devos agenix)
      (devos alejandra)
      (devos nodePackages.prettier)
      (devos shfmt)
      {
        category = "devos";
        name = nvfetcher-bin.pname;
        help = nvfetcher-bin.meta.description;
        command = "cd $PRJ_ROOT/pkgs; ${nvfetcher-bin}/bin/nvfetcher -c ./sources.toml $@";
      }
      (linter treefmt)
      (linter editorconfig-checker)

      (docs mdbook)
    ]
    ++ lib.optionals (!pkgs.stdenv.buildPlatform.isi686) [
      (devos cachix)
    ]
    ++ lib.optionals (pkgs.stdenv.hostPlatform.isLinux && !pkgs.stdenv.buildPlatform.isDarwin) [
      (devos inputs.nixos-generators.defaultPackage.${pkgs.system})
      (devos inputs.deploy.packages.${pkgs.system}.deploy-rs)
    ];
}
