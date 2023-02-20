final: prev: {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) {};
  # then, call packages with `final.callPackage`
  lmt = final.callPackage (import ./lmt) {};
  md-tangle = final.callPackage (import ./tangle/md-tangle.nix) {};
  build-dots = final.callPackage (import ./tangle/build-dots.nix) {};
  switch-dots = final.callPackage (import ./tangle/switch-dots.nix) {};
  easystroke = final.callPackage (import ./easystroke-nix) {};
  cellwriter = final.callPackage (import ./cellwriter) {};
  cellwriter-sh = final.callPackage (import ./cellwriter-sh) {};
}
