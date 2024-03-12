return {
  {
    "kensyo/nvim-scrlbkun",
    config = function()
      require('scrlbkun').setup({
        single_window = true,
        zindex = 10,
        winblend = 40,
        excluded_filetypes = {"NvimTree"},
        excluded_buftypes = {"prompt"},
        fadeout_time = 1000,
        width = 1,
        bar = {
          enable = true,
          draw_events = {"WinScrolled", "BufEnter", "FocusGained"},
          draw_events_tab = {"VimResized", "TabEnter"},
          priority = 100,
          draw_columns = {1},
          sign = " ",
        },
        cursor = {
          enable = true,
          draw_events = {"BufEnter", "FocusGained", "CursorMoved"},
          draw_events_tab = {"VimResized", "TabEnter"},
          priority = 200,
          draw_columns = {1},
          signs = {
            "▔",
            "-",
            "▁",
          },
          sign_arrangement = "skip_first"
        },
        search = {
          enable = true,
          draw_events = {},
          draw_events_tab = {
            "TextChanged",
            "TextChangedI",
            "TextChangedP",
            "TabEnter",
            {
              "CmdlineLeave",
              {
                "/",
                "\\?",
                ":"
              },
            },
            {
              "CmdlineChanged",
              {
                "/",
                "\\?",
              },
            },
          },
          priority = 500,
          draw_columns = {1},
          signs = {
            ".",
            ":",
          },
          use_built_in_signs = true,
        },
        diagnostics = {
          enable = true,
          draw_events = {},
          draw_events_tab = {"BufEnter", "DiagnosticChanged", "TabEnter"},
          priority = 400,
          draw_columns = {2},
          signs = {
            ERROR = {".", ":"},
            WARN = {".", ":"},
            INFO = {".", ":"},
            HINT = {".", ":"},
          },
          use_built_in_signs = true,
        },
        githunks = {
          enable = true,
          draw_events = {},
          draw_events_tab = {
            {
              "User",
              "GitSignsUpdate"
            }
          },
          priority = 300,
          draw_columns = {1},
          signs = {
            add = {"│"},
            delete = {"▸"},
            change = {"│"},
          },
          use_built_in_signs = true,
        },
      })
    end
  }
}

