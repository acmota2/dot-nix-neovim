{
  config,
  lib,
  pkgs,
  ...
}:
let
  mcp-hub-bin = pkgs.writeShellScriptBin "mcp-hub" ''
    exec ${pkgs.nodejs_24}/bin/npx -y mcp-hub@latest "$@"
  '';
in
{
  options.my-nixvim.settings = {
    enable = lib.mkEnableOption {
      type = lib.types.bool;
      default = true;
      description = "Enable my-nixvim settings";
    };
    llm-integration.enable = lib.mkEnableOption "Enable LLM integration";
  };

  config = {
    globals.mapleader = ",";
    keymaps = import ./remaps.nix;
    opts = import ./options.nix;

    autoCmd = [
      {
        event = [
          "BufRead"
          "BufNewFile"
        ];
        pattern = [ "*.ebnf" ];
        command = "setfiletype ebnf";
      }
    ];

    diagnostic.settings = {
      virtual_lines.current_line = true;
      virtual_text = true;
    };

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        transparent = true;
        styles = {
          sidebars = "transparent";
          floats = "transparent";
        };
      };
    };

    extraConfigLua = import ./lua.nix;

    plugins = lib.mkIf config.my-nixvim.settings.enable (import ./plugins.nix);

    extraPackages = with pkgs; [
      isort
      mcp-hub-bin
      nixfmt
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
