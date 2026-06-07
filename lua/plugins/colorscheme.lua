return {
    {
        "navarasu/onedark.nvim",
        enabled = false,
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

            -- onedark.load() -- This loads the theme properly
        end,
    },
    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = true,
        opts = { style = "night" },
    },
    {
        "LazyVim/LazyVim",
        lazy = false,
        opts = {
            colorscheme = "kanagawa",
        },
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        require('kanagawa').setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = "wave",              -- Load "wave" theme
            background = {               -- map the value of 'background' option to a theme
                dark = "wave",           -- try "dragon" !
                light = "lotus"
            },
        })

    }
}
