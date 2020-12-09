{ mkDerivation, base, discord-haskell, stdenv }:
mkDerivation {
  pname = "frugaled";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base discord-haskell ];
  license = stdenv.lib.licenses.agpl3;
}
