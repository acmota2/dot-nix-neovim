{
  colorizer.enable = true;
  cmp = {
    enable = true;
    settings = {
      mapping = {
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.abort()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
      autoEnableSources = true;
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
    };
  };
  codecompanion = {
    enable = true;
    settings = {
      display = {
        chat = {
          window = {
            layout = "vertical";
            position = "right";
            width = 0.35;
            height = 0.4;
          };
        };
      };

      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion";
          opts = {
            port = 20202;
            make_vars = true;
            make_slash_commands = true;
            show_result_in_chat = true;
          };
        };
      };

      logLevel = "TRACE";
      sendCode = true;
      useDefaultActions = true;
      useDefaultPrompts = true;

      adapters = {
        http = {
          ollama_heavy = {
            __raw = ''
              function()
                return require('codecompanion.adapters').extend('ollama', {
                  env = {
                    url = "http://127.0.0.1:11434",
                  },
                  schema = {
                    model = {
                      default = 'qwen2.5-coder:7b-instruct',
                    },
                    num_ctx = {
                      default = 32768,
                    },
                  },
                })
              end
            '';
          };

          ollama_light = {
            __raw = ''
              function()
                return require('codecompanion.adapters').extend('ollama', {
                  env = {
                    url = "http://127.0.0.1:11434",
                  },
                  schema = {
                    model = {
                      default = 'qwen2.5-coder:1.5b-base',
                    },
                    num_ctx = {
                      default = 8192,
                    },
                  },
                })
              end
            '';
          };
        };
      };

      strategies = {
        agent = {
          adapter = "ollama_heavy";
        };
        chat = {
          adapter = "ollama_heavy";
        };
        inline = {
          adapter = "ollama_light";
        };
      };
    };
  };
  comment = {
    enable = true;
    settings.mappings = {
      basic = true;
      extra = true;
    };
  };
  conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        bash = [ "shfmt" ];
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        css = [ "biome" ];
        go = [ "gofmt" ];
        graphql = [ "prettierd" ];
        html = [ "biome" ];
        htmldjango = [ "biome" ];
        htmlmixed = [ "biome" ];
        javascript = [ "biome" ];
        javascriptreact = [ "biome" ];
        json = [ "prettierd" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        python = [ "black" ];
        rust = [ "rustfmt" ];
        sh = [ "shfmt" ];
        sql = [ "sqlfmt" ];
        svelte = [ "biome" ];
        typescript = [ "biome" ];
        typescriptreact = [ "biome" ];
        yaml = [ "prettierd" ];
        zsh = [ "shfmt" ];
      };
      format_on_save.__raw = "{ }";
    };
  };
  diffview.enable = true;
  helm.enable = true;
  lsp-lines.enable = true;
  lsp-status = {
    enable = true;
    settings.diagnostics = false;
  };
  lsp-signature.enable = true;
  lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      lspBuf = {
        "<leader>rn" = "rename";
        "gd" = "definition";
      };
    };
    servers = {
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      # hls.enable = true;
      clangd.enable = true;
      gopls.enable = true;
      html.enable = true;
      htmx.enable = true;
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
  };
  lualine.enable = true;
  markdown-preview.enable = true;
  neo-tree.enable = true;
  nix.enable = true;
  nix-develop.enable = true;
  oil = {
    enable = true;
    settings = {
      buf_options = {
        buflisted = true;
      };
      cleanup_delay_ms = false;
      view_options = {
        show_hidden = true;
      };
    };
  };
  spectre.enable = true;
  telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>b" = "buffers";
      "<leader>rg" = "live_grep";
      # "<leader>e" = "file_browser";
      "<leader>u" = "undo";
    };
    extensions = {
      # file-browser.enable = true;
      undo.enable = true;
    };
  };
  treesitter = {
    enable = true;
    settings = {
      autoInstall = true;
      highlight.enable = true;
    };
  };
  trouble = {
    enable = true;
    settings = {
      use_diagnostic_signs = true;
      keys = {
        "<leader>xx" = "toggle";
        "<leader>xw" = "workspace_diagnostics";
        "<leader>xd" = "document_diagnostics";
        "<leader>xq" = "quickfix";
        "<leader>xl" = "loclist";
        "gr" = "lsp_references";
      };
    };
  };
  ts-autotag = {
    enable = true;
    settings = {
      opts = {
        enable_close = true;
        enable_close_on_slash = false;
        enable_rename = true;
      };
    };
  };
  vim-surround.enable = true;
  web-devicons.enable = true;
  yaml-schema-detect.enable = true;
}
