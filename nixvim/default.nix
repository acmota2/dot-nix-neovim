{
  config,
  lib,
  pkgs,
  ...
}@inputs:
let
  mcp-hub-bin = pkgs.writeShellScriptBin "mcp-hub" ''
    exec ${pkgs.nodejs_24}/bin/npx -y mcp-hub@latest "$@"
  '';
in
{
  options.programs.my-nixvim.settings = {
    enable = lib.mkEnableOption "Enable my-nixvim settings";
    llm-integration.enable = lib.mkEnableOption "Enable LLM integration";
  };

  config = lib.mkIf config.programs.my-nixvim.enable {
    globals.mapleader = ",";
    keymaps = import ./remaps.nix;
    opts = import ./options.nix;

    diagnostic.settings = {
      virtual_lines.current_line = true;
      virtual_text = true;
    };

    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };

    extraConfigLua = import ./lua.nix inputs;

    plugins = lib.mkIf config.programs.my-nixvim.settings.llm-integration.enable (
      import ./plugins.nix inputs
    );

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

    lsp = import ./lsp.nix;
  };
}
