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
  options.programs.my-nixvim = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable my-nixvim";
    };
    settings = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable my-nixvim settings";
      };
      llm-integration.enable = lib.mkEnableOption "Enable LLM integration";
    };
  };

  config = lib.mkIf config.programs.my-nixvim.enable {
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
      update_in_insert = true;
      underline = true;
      signs = true;
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

    extraConfigLua = import ./lua.nix { inherit pkgs lib config; };
    plugins = lib.mkIf config.programs.my-nixvim.settings.enable (
      import ./plugins.nix { inherit pkgs lib config; }
    );

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
