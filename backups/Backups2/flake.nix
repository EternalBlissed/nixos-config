{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs:
    with inputs;
    let
      specialArgs = { inherit inputs self; };
    in
    {
      nixosConfigurations = {
        # FIXME: Fix hostname
        nixos = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./modules.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # FIXME: Fix username 
              home-manager.users.eternal = import ./home.nix;
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
        };
      };

      homeConfigurations = {
        # FIXME: Fix username and hostname
        "eternal@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
