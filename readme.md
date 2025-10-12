<h1 align="center">inlinefun/nix</h1>

# Usage:

## System configuration:
```sh
nixos-rebuild switch --flake /path/to/flake#hostname
```

## Home configuration

If home-manager is already installed:
```sh
home-manager switch --flake /path/to/flake#username
```
else:
```sh
nix run github:nix-community/home-manager switch -- --flake /path/to/flake#username
```
