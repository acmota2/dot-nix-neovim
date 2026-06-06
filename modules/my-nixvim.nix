{ lib, ... }:
{
  imports = [ ../nixvim ];

  options.programs.my-nixvim.enable = lib.mkEnableOption "my-nixvim";
}
