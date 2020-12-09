FROM nixos/nix
WORKDIR /src
COPY . .
RUN nix-env -i git
RUN nix-build
CMD [ "result/bin/frugaled" ]