{
  description = "My neovim nix based configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = _: {
    nixosModules.my-nixvim = import ./modules/my-nixvim.nix;
    # homeManagerModules.my-nixvim = import ./modules/my-nixvim.nix;
  };
}
