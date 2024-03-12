return {
    {"rcarriga/nvim-notify", config = function()
        require("notify").setup({
            -- Your `nvim-notify` configuration options here
        })
        vim.notify = require("notify")
    end}
}
