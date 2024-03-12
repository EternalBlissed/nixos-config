return {
  "andweeb/presence.nvim",
  config = function()
    require("presence"):setup({
      auto_update = true,
      neovim_image_text = "The One True Text Editor",
      main_image = "file",
      client_id = "793271441293967371",
      log_level = nil,
      debounce_timeout = 10,
      enable_line_number = false,
    })
  end,
}
