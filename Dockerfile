FROM nixos/nix
WORKDIR /src
COPY . .
RUN nix-env -i git
RUN nix-env -iA cachix -f https://cachix.org/api/v1/install
RUN cachix use websites
RUN nix-build
CMD [ "result/bin/frugaled" ]