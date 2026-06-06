{ config, lib, ... }:
{
  imports = [ ../nixvim ];

  options.programs.my-nixvim.enable = lib.mkEnableOption "my-nixvim";

  config = lib.mkIf config.programs.my-nixvim.enable {
    programs.neovim.enable = true;
  };
}
