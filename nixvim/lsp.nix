{
  inlayHints.enable = true;
  keymaps = [
    {
      key = "<leader>rn";
      lspBufAction = "rename";
    }
    {
      key = "gd";
      lspBufAction = "definition";
    }
  ];
  servers = {
    rust_analyzer.enable = true;
    # hls.enable = true;
    clangd.enable = true;
    gopls.enable = true;
    html.enable = true;
    htmx = {
      enable = true;
      activate = false;
    };
    hyprls.enable = true;
    lua_ls.enable = true;
    just.enable = true;
    markdown_oxide.enable = true;
    nixd.enable = true;
    pylsp.enable = true;
    svelte.enable = true;
    ts_ls.enable = true;
    yamlls.enable = true;
    zls.enable = true;
  };
}
