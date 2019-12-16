{ stdenv, buildFHSUserEnv, writeScript,  extraPkgs ? pkgs: [ ] }:

buildFHSUserEnv {
  name = "fhs-run";

  targetPkgs = pkgs: with pkgs; [
    bash
    coreutils
    file
    findutils
    git
    pkgs.adoptopenjdk-openj9-bin-8
    which
    unzip
  ] ++ extraPkgs pkgs;

  multiPkgs = pkgs: with pkgs; [
    zlib
  ];

  runScript = writeScript "fhs-exec" ''
    #!${stdenv.shell}
    run="$1"
    if [ ! -z "$run" ]; then
      shift
      exec -- "$run" "$@"
    else
      echo "Usage: fhs-run command-to-run args..." >&2
    fi
  '';
}