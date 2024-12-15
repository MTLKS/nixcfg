{
  description = "MTLKS NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs: 
    let 
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;

      mkSystem = pkgs: system: hostname: profile: user:
        pkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./hosts/${hostname}/configuration.nix
            ./hosts/${hostname}/hardware-configuration.nix
            ./profiles/${profile}/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "backup";

                users.mtlks = ( ./users/${user}.nix );
              };
            }
          ];
          specialArgs = { inherit inputs; };
        };
    in
    {
      nixosConfigurations = {
        glacier = mkSystem inputs.nixpkgs "x86_64-linux" "desktop" "glacier" "mtlks";
        snowdrift = mkSystem inputs.nixpkgs "x86_64-linux" "laptop" "snowdrift" "mtlks";
        permafrost = mkSystem inputs.nixpkgs "x86_64-linux" "homelab" "permafrost" "permafrost";
      };
    };
}
