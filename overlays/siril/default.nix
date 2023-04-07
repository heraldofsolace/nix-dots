final: prev: {
  siril = prev.siril.overrideAttrs (o: rec {
    version = "1.2.0-beta1";
    src = prev.fetchFromGitLab {
      owner = "free-astro";
      repo = o.pname;
      rev = "f3611ada24853cb3870b604621b355d70d06719d";
      sha256 = "UOtm58Jf/cbjjaw2CIVjrQ3IbCiR3rMxFAEXXrW5mHs=";
      fetchSubmodules = true;
    };
    nativeBuildInputs = o.nativeBuildInputs ++ [prev.cmake];
    dontUseCmakeConfigure = true;
    buildInputs = prev.lib.lists.remove prev.librtprocess o.buildInputs;
    patches = [./patch-unfree.patch];
  });
}
