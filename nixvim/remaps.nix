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

  # activate spelling
  {
    mode = "n";
    key = "<leader>uk";
    action = "<cmd>setlocal spell!<CR>";
    options.desc = "Toggle Spell Check";
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

]
