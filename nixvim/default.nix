{ pkgs, ... }:
{
  globals.mapleader = ",";
  keymaps = import ./remaps.nix;
  opts = import ./options.nix;
  plugins = import ./plugins.nix;
  diagnostic.settings = {
    virtual_lines.current_line = true;
    virtual_text = true;
  };
  colorschemes.tokyonight = {
    enable = true;
    settings.style = "night";
  };
  extraConfigLua = ''print("Let's code!")'';
  extraPackages = with pkgs; [
    isort
    nixfmt-rfc-style
    prettierd
    shfmt
    yaml-language-server
  ];
}
