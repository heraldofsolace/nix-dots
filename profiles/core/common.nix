{
  self,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) fileContents;
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in {
  # Sets nrdxp.cachix.org binary cache which just speeds up some builds
  imports = [../cachix];

  environment = {
    # Selection of sysadmin tools that can come in handy
    systemPackages = with pkgs; [
      bc
      binutils
      coreutils
      curl
      cryfs
      direnv
      dnsutils
      fd
      git
      bottom
      jq
      manix
      moreutils
      nix-index
      nmap
      ripgrep
      skim
      tealdeer
      whois
      vim
      openalSoft
      comma
      vlc
      kdenlive
      mediainfo
      ffmpeg-full
      audacity
      xsane
      dosfstools
      gptfdisk
      iputils
      usbutils
      wine
      winetricks
    ];
    shells = [pkgs.fish];

    shellAliases = let
      # The `security.sudo.enable` option does not exist on darwin because
      # sudo is always available.
      ifSudo = lib.mkIf (isDarwin || config.security.sudo.enable);
    in {
      # quick cd
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      # git
      g = "git";

      # grep
      grep = "rg";
      gi = "grep -i";

      # internet ip
      # TODO: explain this hard-coded IP address
      myip = "dig +short myip.opendns.com @208.67.222.222 2>&1";

      # nix
      n = "nix";
      np = "n profile";
      ni = "np install";
      nr = "np remove";
      ns = "n search --no-update-lock-file";
      nf = "n flake";
      nepl = "n repl '<nixpkgs>'";
      srch = "ns nixos";
      orch = "ns override";
      mn = ''
        manix "" | grep '^# ' | sed 's/^# \(.*\) (.*/\1/;s/ (.*//;s/^# //' | sk --preview="manix '{}'" | xargs manix
      '';
      top = "btm";

      # sudo
      s = ifSudo "sudo -E ";
      si = ifSudo "sudo -i";
      se = ifSudo "sudoedit";

      # nix
      nrb = ifSudo "sudo nixos-rebuild";

      # fix nixos-option for flake compat
      nixos-option = "nixos-option -I nixpkgs=${self}/lib/compat";

      # systemd
      ctl = "systemctl";
      stl = ifSudo "s systemctl";
      utl = "systemctl --user";
      ut = "systemctl --user start";
      un = "systemctl --user stop";
      up = ifSudo "s systemctl start";
      dn = ifSudo "s systemctl stop";
      jtl = "journalctl";
    };
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.verbose = true;

  fonts.fonts = with pkgs; [
    nerdfonts
    powerline-fonts
    dejavu_fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  nix = {
    # Improve nix store disk usage
    gc.automatic = true;

    # Prevents impurities in builds
    settings = {
      sandbox = true;

      # Give root user and wheel group special Nix privileges.
      trusted-users = ["root" "@wheel"];
      system-features = ["nixos-test" "benchmark" "big-parallel" "kvm"];
      # Improve nix store disk usage
      auto-optimise-store = true;
      allowed-users = ["@wheel"];
    };

    # Generally useful nix option defaults
    extraOptions = ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';
  };

  fonts.fontconfig.defaultFonts = {
    monospace = ["FiraCode Nerd Font Mono"];
    sansSerif = ["DejaVu Sans"];
  };

  programs.bash = {
    # Enable starship
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init bash)"
    '';
    # Enable direnv, a tool for managing shell environments
    interactiveShellInit = ''
      eval "$(${pkgs.direnv}/bin/direnv hook bash)"
    '';
  };

  programs.fuse = {
    userAllowOther = true;
  };

  # For rage encryption, all hosts need a ssh key pair
  services.openssh = {
    enable = true;
    openFirewall = lib.mkDefault false;
  };

  # Service that makes Out of Memory Killer more effective
  services.earlyoom.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: true;
}
