return {
    {
        "navarasu/onedark.nvim",
        enabled = true,
        lazy = true,
        dependencies = { "Shatur/neovim-ayu" },
        config = function()
            local onedark = require("onedark")
            onedark.setup({
                style = "darker",
                term_colors = true,
                colors = {
                    -- your custom backgrounds
                    bg0 = "#0F1419",
                    bg1 = "#0F1419",
                    bg2 = "#252525",
                    bg3 = "#2b2b2b",
                    bg4 = "#313131",
                    -- ayu dark text/syntax colors
                    fg         = "#bfbdb6", -- normal text
                    red        = "#f07178", -- errors, delimiters
                    orange     = "#ff8f40", -- keywords
                    yellow     = "#e6b450", -- accent, warnings
                    green      = "#7fd962", -- strings
                    cyan       = "#39bae6", -- tags, attributes
                    blue       = "#59c2ff", -- functions, entities
                    purple     = "#d2a6ff", -- constants, numbers
                    grey       = "#565b66", -- comments
                    light_grey = "#8a9199", -- punctuation
                },
                highlights = {
                    LineNr                  = { fg = "#4d5566" },       -- inactive line numbers
                    CursorLineNr            = { fg = "#e6b450" },        -- current line (ayu accent)
                    NormalCursor            = { fg = "#FFFCF9", bg = "#F29718"},
                    NormalFloat             = { bg = "#1E1E1F" },
                    InsertCursor            = { fg = "#FFFCF9", bg = "#F29718"},
                    BlinkCmpMenu            = { fg = "#FFFFFF", bg = "#1E1E1F" },
                },
            })
            onedark.load()
        end,
    },
    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        opts = { style = "night" },
    },
    {
        "bluz71/vim-moonfly-colors",
        enabled = false,
        name = "moonfly",
        lazy = false,
    },

    {
        "shatur/neovim-ayu",
        enabled = false,
        lazy = false,
        opts = {
        },

        config = function()
            local ayu = require("ayu")
            ayu.setup({
                overrides = {
                    Normal = { bg = "#181818" },
                    NormalFloat = { bg = "#181818" },
                    ColorColumn = { bg = "#181818" },
                    SignColumn = { bg = "#181818" },
                    Folded = { bg = "#181818" },
                    FoldColumn = { bg = "#181818" },
                    CursorLine = { bg = "#181818" },
                    CursorColumn = { bg = "#181818" },
                    VertSplit = { bg = "#181818" },
                    LineNr = { fg = "#4d5566" },        -- inactive line numbers
                    CursorLineNr = { fg = "#e6b450" },  -- current line number (ayu's accent yellow)
                    Visual = { bg = "#2a3040", fg = "#e6e1cf" },
                }
            })
        end,
    },

    {
        "LazyVim/LazyVim",
        lazy = false,
        opts = {
            colorscheme = "onedark",
        },
    },
}
