_: {
  extraConfigLua = ''
    print("Let's code!")

    -- mcphub config
    require("mcphub").setup({
      cmd = "npx",
      cmd_args = { "-y", "mcp-hub" },
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
}
