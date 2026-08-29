{
  inlayHints.enable = true;
  diagnostics = {
    update_in_insert = true;
    virtual_text = {
      enable = true;
      prefix = "●";
      separate_lines = false;
    };
    underline = true;
    signs = true;
  };
  keymaps = [
    {
      key = "<leader>rn";
      lspBufAction = "rename";
    }
    {
      key = "gd";
      lspBufAction = "definition";
    }
    {
      key = "<leader>ca";
      lspBufAction = "code_action";
      options = {
        desc = "LSP Code Actions";
      };
    }
  ];
  servers = {
    rust_analyzer.enable = true;
    # hls.enable = true;
    clangd = {
      enable = true;
      cmd = [
        "clangd"
        "-extra-arg=-Iinclude"
      ];
    };
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
