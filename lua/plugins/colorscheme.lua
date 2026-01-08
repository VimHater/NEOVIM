return {
    {
        "navarasu/onedark.nvim",
        enabled = true,
        lazy = true,
        config = function()
            local onedark = require("onedark")
            onedark.setup({
                style = "darker", -- You can change this to 'dark', 'cool', 'deep', 'warm', etc.
            })
            --onedark.load() -- This loads the theme properly
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { style = "night" },
    },
    {
        "LazyVim/LazyVim",
        lazy = false,
        opts = {
            colorscheme = "onedark",
        },
    },
    -- Lazy
}
