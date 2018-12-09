{ stdenv, buildFHSUserEnv, writeScript,  extraPkgs ? pkgs: [ ] }:

buildFHSUserEnv {
  name = "android-fhs-run";

  targetPkgs = pkgs: with pkgs; [
    bash
    coreutils
    file
    findutils
    git
    jdk
    which
    unzip
  ] ++ extraPkgs pkgs;

  multiPkgs = pkgs: with pkgs; [
    zlib
  ];

  runScript = writeScript "android-fhs-exec" ''
    #!${stdenv.shell}
    run="$1"
    if [ "$run" = "" ]; then
      echo "Usage: android-fhs-run command-to-run args..." >&2
      exit 1
    fi
    shift
    exec -- "$run" "$@"
  '';
}