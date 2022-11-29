{
  writeShellApplication,
  build-dots,
}:
writeShellApplication {
  name = "switch";
  runtimeInputs = [build-dots];
  text = ''
    SYSTEM="''${1:-}"
    if [ -z "$SYSTEM" ]; then
      echo "USAGE: $0 <SYSTEM> <FLAGS>"
      exit 1
    fi
    TMPDIR="$(mktemp -d)"

    build-dots "$TMPDIR"
    >&2 echo "Switching to system $SYSTEM..."
    nixos-rebuild switch "''${@:2}" --flake "$TMPDIR#$SYSTEM"
  '';
}
