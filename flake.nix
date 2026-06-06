{
  description = "My neovim nix based configuration";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    { nixvim, ... }:
    {
      homeManagerModules.my-nixvim = _: {
        imports = [
          ./modules/my-nixvim.nix
          nixvim.homeManagerModules.nixvim
        ];
      };
      nixosModules.my-nixvim = _: {
        imports = [
          ./modules/my-nixvim.nix
          nixvim.nixosModules.nixvim
        ];
      };
    };
}
