[
  # select all
  {
    mode = "n";
    key = "<leader>a";
    action = "ggVG";
  }
  {
    mode = "n";
    key = "<leader>o";
    action = "<cmd>Oil<CR>";
  }
  {
    mode = "n";
    key = "<leader>sr";
    action = "<cmd>Spectre<CR>";
  }
  {
    mode = "n";
    key = "<leader>nt";
    action = "<cmd>Neotree toggle<CR>";
  }
  {
    mode = "n";
    key = "<leader>/";
    action = "<cmd>nohlsearch<CR>";
    options = {
      silent = true;
      noremap = true;
    };
  }

  # diffing
  {
    mode = "n";
    key = "]c";
    action = "]c";
    options = {
      desc = "Next diff change";
    };
  }
  {
    mode = "n";
    key = "[c";
    action = "[c";
    options = {
      desc = "Previous diff change";
    };
  }

  # basically, Alt arrows of vscode re-imagined for vim, enhanced
  {
    mode = "v";
    key = "J";
    options.silent = true;
    action = ":'<,'>m '>+<C-R>v<CR>gv=gv";
  }
  {
    mode = "v";
    key = "K";
    options.silent = true;
    action = ":'<,'>m '<-2<C-R>v<CR>gv=gv";
  }

  # n - next, N - previous (searching terms)
  {
    mode = "n";
    key = "n";
    options.silent = true;
    action = "nzzzv";
  }
  {
    mode = "n";
    key = "N";
    options.silent = true;
    action = "Nzzzv";
  }

  # codecompanion remaps
  {
    mode = [
      "n"
      "v"
    ];
    key = "<leader>ca";
    action = "<cmd>CodeCompanionActions<cr>";
    options = {
      silent = true;
      noremap = true;
      desc = "CodeCompanion Actions";
    };
  }
  {
    mode = [
      "n"
      "v"
    ];
    key = "<leader>cc";
    action = "<cmd>CodeCompanion<cr>";
    options = {
      silent = true;
      noremap = true;
      desc = "CodeCompanion Inline Assistant";
    };
  }
  {
    mode = "n";
    key = "<leader>cb";
    action = "<cmd>CodeCompanionChat Toggle<cr>";
    options = {
      silent = true;
      noremap = true;
      desc = "CodeCompanion Chat Buffer";
    };
  }
]
