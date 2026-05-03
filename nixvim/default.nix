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
  extraConfigLua = ''
    print("Let's code!")
    require("mcphub").setup({
      port = 20202,
      use_bundled_binary = false,
      servers = {
        filesystem = {
          command = "npx",
          args = {
            "-y",
            "@modelcontextprotocol/server-filesystem",
            vim.fs.root(0, { ".git" }) or vim.fn.getcwd()
          }
        }
      }
    })
  '';
  extraPackages = with pkgs; [
    isort
    nixfmt
    prettierd
    shfmt
    yaml-language-server
  ];
  extraPlugins = with pkgs; [
    vimPlugins.mcphub-nvim
  ];
}
