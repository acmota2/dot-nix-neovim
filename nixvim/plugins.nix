{ pkgs, ... }:
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
      formatters = {
        clang-format.prepend_args = [
          "-style=file"
        ];
      };
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
  lsp-lines.enable = true;
  lsp-signature.enable = true;
  lualine.enable = true;
  markdown-preview.enable = true;
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
    extensions = {
      file-browser = {
        enable = true;
        settings.hidden = true;
      };
      undo.enable = true;
    };
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fF" = ''
        lua = require('telescope.builtin').find_files({ hidden = false, no_ignore = false })
      '';
      "<leader>b" = "buffers";
      "<leader>rg" = "live_grep";
      "<leader>e" = "file_browser";
      "<leader>u" = "undo";
    };
    settings.pickers.find_files.hidden = true;
  };
  treesitter = {
    enable = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    settings = {
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
