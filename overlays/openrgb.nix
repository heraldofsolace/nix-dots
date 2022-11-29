final: prev: {
  openrgb-latest = prev.openrgb.overrideAttrs (o: rec {
    src = prev.fetchFromGitLab {
      owner = "CalcProgrammer1";
      repo = "OpenRGB";
      rev = "1a10ea79aaf88eb751684c326825b2f82fb73234";
      sha256 = "sha256-MZATZkaZXEYxvVQmicCwPcEyYJG5THkNdzW33PaSq2I=";
      deepClone = true;
      leaveDotGit = true;
    };
    nativeBuildInputs = [prev.qt5Full prev.pkg-config prev.git];
    buildPhase = ''
      substituteInPlace OpenRGB.pro --replace "GIT_COMMIT_ID   = \''$\''$system(git --git-dir \''$\''$_PRO_FILE_PWD_/.git --work-tree \''$\''$_PRO_FILE_PWD_ rev-parse HEAD)" "GIT_COMMIT_ID = 1a10ea79aaf88eb751684c326825b2f82fb73234"
      substituteInPlace OpenRGB.pro --replace "GIT_COMMIT_DATE = \''$\''$system(git --git-dir \''$\''$_PRO_FILE_PWD_/.git --work-tree \''$\''$_PRO_FILE_PWD_ show -s --format=%ci HEAD)" "GIT_COMMIT_DATE = 2022-10-23 17:58:36 -0700"
      substituteInPlace OpenRGB.pro --replace "GIT_BRANCH      = \''$\''$system(git --git-dir \''$\''$_PRO_FILE_PWD_/.git --work-tree \''$\''$_PRO_FILE_PWD_ rev-parse --abbrev-ref HEAD)" "GIT_BRANCH = master"
      substituteInPlace scripts/build-udev-rules.sh --replace /bin/bash ${prev.bash}/bin/bash
      qmake OpenRGB.pro GIT_COMMIT_ID="1a10ea79aaf88eb751684c326825b2f82fb73234" GIT_COMMIT_DATE="2022-10-23 17:58:36 -0700" GIT_BRANCH="master"
      make -j4
      scripts/build-udev-rules.sh . 1a10ea79aaf88eb751684c326825b2f82fb73234
    '';
  });
}
