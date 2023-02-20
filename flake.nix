{
  description = "A highly structured configuration database.";

  nixConfig.extra-experimental-features = "nix-command flakes";
  nixConfig.extra-substituters = "https://nrdxp.cachix.org https://nix-community.cachix.org";
  nixConfig.extra-trusted-public-keys = "nrdxp.cachix.org-1:Fc5PSqY2Jm1TrWfm88l6cvGWwz3s93c6IOifQWnhNW4= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";

  inputs = {
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    # Track channels with commits tested and built by hydra
    nixos.url = "github:nixos/nixpkgs/nixos-22.05";
    latest.url = "github:nixos/nixpkgs/nixos-unstable";

    digga.url = "github:divnix/digga";
    digga.inputs.nixpkgs.follows = "latest";
    digga.inputs.nixlib.follows = "latest";
    digga.inputs.home-manager.follows = "home";
    digga.inputs.deploy.follows = "deploy";

    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "latest";

    deploy.url = "github:serokell/deploy-rs";
    deploy.inputs.nixpkgs.follows = "latest";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "latest";

    nvfetcher.url = "github:berberman/nvfetcher";
    nvfetcher.inputs.nixpkgs.follows = "latest";

    naersk.url = "github:nmattia/naersk";
    naersk.inputs.nixpkgs.follows = "latest";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nixos-generators.url = "github:nix-community/nixos-generators";

    comma.url = "github:nix-community/comma";
    comma.inputs.nixpkgs.follows = "latest";

    homeage = {
      url = "github:jordanisaacs/homeage";
      inputs.nixpkgs.follows = "latest";
    };

    grub2-themes.url = github:vinceliuice/grub2-themes;
    grub2-themes.inputs.nixpkgs.follows = "latest";

    impermanence.url = "github:nix-community/impermanence";
  };
  outputs = {
    self,
    digga,
    nixos,
    latest,
    home,
    nixos-hardware,
    nur,
    agenix,
    homeage,
    impermanence,
    nvfetcher,
    deploy,
    nixpkgs,
    ...
  } @ inputs:
    digga.lib.mkFlake
    {
      inherit self inputs;

      channelsConfig = {allowUnfree = true;};
      supportedSystems = ["x86_64-linux"];

      channels = {
        nixos = {
          imports = [(digga.lib.importOverlays ./overlays)];
          overlays = [];
        };
        latest = {
          imports = [(digga.lib.importOverlays ./overlays)];
          overlays = [];
        };
      };
      lib = import ./lib {lib = digga.lib // nixos.lib;};
      sharedOverlays = [
        (final: prev: {
          __dontExport = true;
          lib = prev.lib.extend (lfinal: lprev: {
            our = self.lib;
          });
        })

        nur.overlay
        agenix.overlay
        nvfetcher.overlays.default

        (import ./pkgs)
      ];

      nixos = {
        hostDefaults = {
          system = "x86_64-linux";
          channelName = "latest";
          imports = [(digga.lib.importExportableModules ./modules)];
          modules = [
            {lib.our = self.lib;}
            digga.nixosModules.bootstrapIso
            digga.nixosModules.nixConfig
            home.nixosModules.home-manager
            agenix.nixosModules.age
            impermanence.nixosModules.impermanence
          ];
        };

        imports = [(digga.lib.importHosts ./hosts)];
        hosts = {
          /*
          set host-specific properties here
          */
          andromeda = {};
          horologium = {};
        };
        importables = rec {
          profiles =
            digga.lib.rakeLeaves ./profiles
            // {
              users = digga.lib.rakeLeaves ./users;
            };
          suites = with profiles; rec {
            base = [users.aniket users.root];
            desktop-plasma = base ++ [desktop.plasma];
            desktop-gnome = base ++ [desktop.gnome];
            andromeda = [
              base
              core.andromeda
              # desktop-gnome
              desktop-plasma
              development.cc
              development.node
              development.python
              development.rust
              development.nix
              development.ides.jetbrains
              networking.common
              networking.samba
              services.docker
              services.virtualbox
              gaming.steam
              services.postgres
              misc.openrgb
              misc.op
              misc.gparted
              security.sudo
            ];
            horologium = [
              base
              core.horologium
              desktop-plasma
              # desktop-gnome
              development.cc
              development.node
              development.python
              development.rust
              development.nix
              development.ides.jetbrains
              networking.common
              networking.samba
              services.docker
              misc.op
              misc.gparted
              security.sudo
              security.fingerprint
            ];
          };
        };
      };
      home = {
        imports = [(digga.lib.importExportableModules ./home/modules)];
        modules = [homeage.homeManagerModules.homeage impermanence.nixosModules.home-manager.impermanence];
        importables = rec {
          profiles = digga.lib.rakeLeaves ./home/profiles;
          suites = with profiles; rec {
            base = [shells.direnv development.git shells.bash];

            aniket = [
              base
              email
              shells.cli
              browsers.firefox
              browsers.brave
              shells.fish
              shells.bat
              shells.exa
              shells.mcfly
              shells.tmux
              shells.zoxide
              shells.ssh
              shells.jq
              shells.gpg
              development.go
              shells.thefuck
              editors.nvim
              editors.vscode
              comms
              desktop.kdeconnect
              desktop.kmymoney
              misc.xprintidle
              misc.nextcloud
              misc.tex
              misc.obs
            ];
          };
        };
        users = {
          # TODO: does this naming convention still make sense with darwin support?
          #
          # - it doesn't make sense to make a 'nixos' user available on
          #   darwin, and vice versa
          #
          # - the 'nixos' user might have special significance as the default
          #   user for fresh systems
          #
          # - perhaps a system-agnostic home-manager user is more appropriate?
          #   something like 'primaryuser'?
          #
          # all that said, these only exist within the `hmUsers` attrset, so
          # it could just be left to the developer to determine what's
          # appropriate. after all, configuring these hm users is one of the
          # first steps in customizing the template.
          aniket = {suites, ...}: {
            imports = suites.aniket;
            home.stateVersion = "22.05";
          };
        }; # digga.lib.importers.rakeLeaves ./users/hm;
      };
      devshell = ./shell;
      homeConfigurations = digga.lib.mkHomeConfigurations self.nixosConfigurations;
      deploy.nodes = digga.lib.mkDeployNodes self.nixosConfigurations {};
    };
}
