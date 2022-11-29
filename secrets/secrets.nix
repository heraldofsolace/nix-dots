let
  # set ssh public keys here for your system and user
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID6aEN+uV1MS2DpJore5tDTebtnpauc4Qz6fUP1XM2dh root@andromeda";
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3GRcKkyXAJvKjyovyzkPzV9aaT7FRBSbnR1t1bmwqP";
  allKeys = [system user];
in {
  "aniket.age".publicKeys = allKeys;
}
