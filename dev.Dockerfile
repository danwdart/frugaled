FROM nixos/nix
WORKDIR /src
COPY . .
RUN nix-env -i git stack cabal-install ghc wget cabal2nix
RUN nix-build
CMD [ "nix-shell" ]