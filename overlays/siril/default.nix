final: prev: {
  siril = prev.siril.overrideAttrs (o: rec {
    version = "1.2.0-beta2";
    src = prev.fetchFromGitLab {
      owner = "free-astro";
      repo = o.pname;
      rev = "ac0d071fd781b817e93f5d01792e4d4e5d3a55bd";
      sha256 = "sha256-/JUxVSzgwe7jcbc1ALw+QbK5ttEMLuqVlR3Pv+G9n0w=";
      fetchSubmodules = true;
    };
    nativeBuildInputs = o.nativeBuildInputs ++ [prev.cmake];
    dontUseCmakeConfigure = true;
    buildInputs = prev.lib.lists.remove prev.librtprocess o.buildInputs;
    # patches = [./patch-unfree.patch];
  });
}
