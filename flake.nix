{
  description = "My neovim nix based configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      nixvim,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = ./nixvim;
        };

        checks.default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule {
          inherit pkgs;
          module = ./nixvim;
        };
      }
    )
    // {
      homeManagerModules.my-nixvim = {
        imports = [
          nixvim.homeManagerModules.nixvim
          ./modules/home-manager.nix
        ];
      };

      nixosModules.my-nixvim = {
        imports = [
          nixvim.nixosModules.nixvim
          ./modules/nixos.nix
        ];
      };
    };
}
