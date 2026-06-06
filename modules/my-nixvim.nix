{ lib, config, ... }:
{
  imports = [ ../nixvim ];

  options.programs.my-nixvim = {
    enable = lib.mkEnableOption "my-nixvim";
    settings = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Nixvim module configuration overrides";
    };
  };

  config =
    lib.mkIf config.programs.my-nixvim.enable {
      programs.neovim.enable = true;
    }
    // config.programs.my-nixvim.settings;
}
