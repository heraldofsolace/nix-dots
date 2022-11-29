{
  stdenv,
  lib,
  buildGoPackage,
  fetchFromGitHub,
}:
buildGoPackage rec {
  pname = "lmt";
  version = "21-4-2021";

  goPackagePath = "main";

  src = fetchFromGitHub {
    owner = "driusan";
    repo = "lmt";
    rev = "62fe18f2f6a6e11c158ff2b2209e1082a4fcd59c";
    sha256 = "0jpiv9xm8wbi8rdfkkqfhqmjqqfzzhbwwh9m2n52cy4dxbfs8wbh";
  };

  postInstall = ''
    mv $out/bin/main $out/bin/lmt
  '';

  meta = with lib; {
    description = "A literate programming tool for Markdown";
    homepage = "https://github.com/driusan/lmt";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
