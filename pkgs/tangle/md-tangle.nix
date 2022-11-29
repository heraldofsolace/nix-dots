{
  stdenv,
  lib,
  lmt,
  srcPath ? ../../.,
}:
stdenv.mkDerivation {
  name = "md-tangle";
  nativeBuildInputs = [lmt];
  src = builtins.path {
    filter = p: t: let
      bn = baseNameOf p;
    in
      t != "symlink" && (t != "directory" || bn != "out") && !(bn == "README.md") && !(lib.hasPrefix "." bn);
    path = srcPath;
    name = "src";
  };

  buildPhase = ''
    export PATHS=$(find ./ -type f -name '*.md')
    lmt $PATHS
    rm -rf $PATHS
  '';

  installPhase = ''
    cp -r ./ "$out"
  '';
}
