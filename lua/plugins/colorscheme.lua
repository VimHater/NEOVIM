return {
    {
        "navarasu/onedark.nvim",
        enabled = true,
        lazy = true,
        config = function()
            local onedark = require("onedark")
            onedark.setup({
                style = "darker", -- You can change this to 'dark', 'cool', 'deep', 'warm', etc.
                colors = {
                    bg0 = "#181818", -- main background
                    bg1 = "#1f1f1f", -- splits, sidebars
                    bg2 = "#252525", -- statusline, tabline
                    bg3 = "#2b2b2b", -- popups, menus
                    bg4 = "#313131", -- borders, separators
                },
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
