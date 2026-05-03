{ pkgs, ... }@inputs:
let
  mcp-hub-bin = pkgs.writeShellScriptBin "mcp-hub" ''
    exec ${pkgs.nodejs_24}/bin/npx -y mcp-hub@latest "$@"
  '';
in
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
  extraConfigLua = (import ./lua.nix inputs).extraConfigLua;
  extraPackages = with pkgs; [
    isort
    nixfmt
    mcp-hub-bin
    prettierd
    shfmt
    yaml-language-server
  ];
  extraPlugins = with pkgs; [
    vimPlugins.mcphub-nvim
  ];
}
