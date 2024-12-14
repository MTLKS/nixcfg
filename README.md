# MTLKS NixOS Config

work in progress

## Commands cheatsheet

Build flake as generation and switch
```bash
sudo nixos-rebuild switch --flake .#glacier
# or 
sudo nixos-rebuild switch --flake .#snowdrift
```

Build flake and test
```bash
sudo nixos-rebuild test --flake .#glacier
# or 
sudo nixos-rebuild test --flake .#snowdrift
```

Update flake
```bash
nix flake update
```

List system generations
```bash
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
```

Deletes system generations older than 90 days
```bash
sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system 90d
```

List packages that are dead
```bash
nix-store --gc --print-dead
```

List packages that are live
```bash
nix-store --gc --print-live
```

Run garbage collector to delete dead packages
```bash
nix-store --gc
```