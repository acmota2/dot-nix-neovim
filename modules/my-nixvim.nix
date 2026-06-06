{ lib, ... }:
{
  options.programs.my-nixvim = {
    enable = lib.mkEnableOption "my-nixvim";
    settings = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Nixvim module configuration overrides";
    };
  };
}
