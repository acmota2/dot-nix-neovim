{ config, lib, ... }:
let
  cfg = config.programs.my-nixvim;
in
{
  options.programs.my-nixvim = {
    enable = lib.mkEnableOption "my-nixvim";
    settings = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable my-nixvim settings";
      };
      llm-integration.enable = lib.mkEnableOption "Enable LLM integration";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      imports = [ ../nixvim ];
      my-nixvim.settings = {
        enable = cfg.settings.enable;
        llm-integration.enable = cfg.settings.llm-integration.enable;
      };
    };
  };
}
