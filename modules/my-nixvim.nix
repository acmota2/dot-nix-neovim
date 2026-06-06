{ lib, config, ... }:
{
  options.programs.my-nixvim = {
    enable = lib.mkEnableOption "my-nixvim";
    settings = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Nixvim module configuration overrides";
    };
  };

  config = lib.mkIf config.programs.my-nixvim.enable {
    imports = [ ../nixvim ];
    programs.neovim.enable = true;
  } // config.programs.my-nixvim.settings;
}
