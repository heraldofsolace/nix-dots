let
  # set ssh public keys here for your system and user
  system-andromeda = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID6aEN+uV1MS2DpJore5tDTebtnpauc4Qz6fUP1XM2dh root@andromeda";
  user-andromeda = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3GRcKkyXAJvKjyovyzkPzV9aaT7FRBSbnR1t1bmwqP";
  system-horologium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMyPw3kW7wC1Ir5lTzfp99uzISyKgijbIMotno0oMdPR root@nixos";
  aniket-horologium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPlxnSL+JbBa97bXoIuX1BIFp0ht6/4RJ4Kkl8TJsyYo aniket@nixos";
  allKeys = [system-andromeda user-andromeda system-horologium aniket-horologium];
in {
  "aniket.age".publicKeys = allKeys;
}
