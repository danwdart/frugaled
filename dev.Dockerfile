FROM nixos/nix
RUN nix-env -i git
COPY . .
RUN nix-env -i stack cabal-install ghc wget cabal2nix
RUN nix-build
