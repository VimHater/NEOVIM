return {
    {
        "navarasu/onedark.nvim",
        enabled = true,
        lazy = false,
        config = function()
            local onedark = require("onedark")
            onedark.setup({
                style = "darker", -- You can change this to 'dark', 'cool', 'deep', 'warm', etc.
            })
            --onedark.load() -- This loads the theme properly
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = { style = "night" },
    },

    {
        "LazyVim/LazyVim",
        lazy = false,
        opts = {
            colorscheme = "onedark",
        },
    },
}
