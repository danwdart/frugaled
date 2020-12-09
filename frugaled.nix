{ mkDerivation, base, discord-haskell, postgresql-simple, stdenv }:
mkDerivation {
  pname = "frugaled";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base discord-haskell postgresql-simple
  ];
  license = stdenv.lib.licenses.agpl3;
}
