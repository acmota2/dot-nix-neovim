{ config, lib, ... }:
let
  settingsCfg = config.programs.my-nixvim.settings;
in
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
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-y>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })";
      };
      autoEnableSources = true;
      completion = {
        completeopt = "menu,menuone,noinsert";
      };
      experimental = {
        ghost_text = true;
      };
      sources = [
        {
          name = "nvim_lsp";
          priority = 100;
        }
        {
          name = "luasnip";
          priority = 90;
        }
        {
          name = "path";
          priority = 80;
        }
        {
          name = "buffer";
          priority = 70;
        }
      ];
      cmp-nvim-lsp.enable = true;
      cmp-luasnip.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp-calc.enable = true;
      cmp-emoji.enable = true;
    };
  };

  codecompanion = lib.mkIf settingsCfg.llm-integration.enable {
    enable = true;
    settings = {
      display.chat = {
        show_reasoning = false;
        window = {
          layout = "vertical";
          position = "right";
          width = 0.35;
          height = 0.4;
        };
      };

      # MCP Extensions
      extensions.mcphub = {
        callback = "mcphub.extensions.codecompanion";
        opts = {
          port = 20202;
          make_vars = false;
          make_slash_commands = false;
          show_result_in_chat = true;
        };
      };

      logLevel = "TRACE";
      sendCode = true;
      useDefaultActions = true;
      useDefaultPrompts = true;

      adapters.http.ollama_tools.__raw = ''
        function()
          return require('codecompanion.adapters').extend('openai', {
            url = "http://127.0.0.1:11434/v1/chat/completions",
            env = {
              api_key = "ollama",
            },
            schema = {
              model = {
                default = "llama3.1:8b",
              },
            },
          })
        end
      '';

      strategies = {
        agent = {
          adapter = "ollama_tools";
          prompts.system_prompt.__raw = ''
            function()
              local status, mcphub = pcall(require, "mcphub")
              if status then
                local hub = mcphub.get_hub_instance()
                if hub then
                  return hub:get_active_servers_prompt()
                end
              end
              return "You are an AI assistant."
            end
          '';
        };
        chat.adapter = "ollama_tools";
        inline = {
          adapter = "ollama_tools";
          placement = "buffer";
          prompts.system_prompt = ''
            You are an expert AI programming assistant.
            The user wants to replace their selected code with your output.

            CRITICAL RULES:
            1. You MUST wrap your code replacement in a markdown code block matching the file's language.
            2. Do NOT add any explanations, introductory text, or closing remarks.
            3. Output ONLY the code block.
          '';
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
        json = [ "biome" ];
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
  gitsigns.enable = true;
  helm.enable = true;
  lsp-lines = {
    enable = true;
    settings = {
      max_length = 100;
      wrap = true;
    };
  };
  lsp-signature.enable = true;
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
    hidden = true;
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>b" = "buffers";
      "<leader>rg" = "live_grep";
      "<leader>e" = "file_browser";
      "<leader>u" = "undo";
    };
    extensions = {
      file-browser.enable = true;
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
