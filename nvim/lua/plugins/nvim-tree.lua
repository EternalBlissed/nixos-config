return {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup()
      -- Keybinding for Space + e to open nvim-tree
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      map("n", "<Space>e", ":NvimTreeToggle<CR>", opts)
    end
  }
  