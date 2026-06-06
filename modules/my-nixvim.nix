{ config, lib, ... }:
let
  cfg = config.programs.my-nixvim;
in
{
  options.programs.my-nixvim = {
    enable = lib.mkEnableOption "my-nixvim";
    settings = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Nixvim module configuration overrides";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      imports = [ ../nixvim ];
    }
    // cfg.settings;
  };
}
