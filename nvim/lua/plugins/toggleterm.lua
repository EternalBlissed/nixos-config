return {
  "akinsho/nvim-toggleterm.lua",
  keys = "<C-n>",
  config = function()
    local map = vim.api.nvim_set_keymap
    local buf_map = vim.api.nvim_buf_set_keymap

    require("toggleterm").setup({
      -- Adjust size to nearly cover the full screen for floating terminal
      size = function(term)
        if term.direction == "float" then
          -- Subtracting from vim.o.columns/lines to leave margins
          return { width = vim.o.columns - 10, height = vim.o.lines - 4 }
        elseif term.direction == "horizontal" then
          return 15 -- Adjust if you want to use horizontal sometimes
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4 -- Adjust if you want to use vertical sometimes
        end
      end,
      open_mapping = "<C-n>",
      shading_factor = "1", -- Lighten terminal background
      direction = "float", -- Change to 'float' to make terminal window cover nearly all the screen
      float_opts = {
        border = "single", -- Customize the border (optional)
        width = vim.o.columns - 10, -- Cover the full width with some margin
        height = vim.o.lines - 4, -- Cover the full height with some margin
        winblend = 0,
      },
    })

    local opts = { noremap = true }
    map("t", "<ESC>", "<C-\\><C-n>", opts) -- back to normal mode in Terminal

    -- Better navigation to and from terminal
    local set_terminal_keymaps = function()
      buf_map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
      buf_map(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      buf_map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      buf_map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      buf_map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        set_terminal_keymaps()
        vim.cmd([[setlocal nospell]])
      end,
      desc = "Mappings for navigation with a terminal",
    })
  end,
}

