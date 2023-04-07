{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    siril
    kstars
    stellarium
  ];

  services.gvfs.enable = true;
}
