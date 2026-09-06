{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.my-nixvim.settings.llm-integration.enable ''
  require("mcphub").setup({
    cmd = "mcp-hub", 
    port = 20202,
    use_bundled_binary = false,
    servers = {
      filesystem = {
        command = "${pkgs.nodejs_24}/bin/npx", 
        args = {
          "-y",
          "@modelcontextprotocol/server-filesystem",
          vim.fs.root(0, { ".git" }) or vim.fn.getcwd()
        }
      }
    }
  })
''
