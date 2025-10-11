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
        enabled = false,
        lazy = true,
    },

    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = false,
        opts = {
            style = "night",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },

    {
        "rebelot/kanagawa.nvim",
        enabled = true,
        lazy = false,
        opts = {
            transparent = true,
        }
    },
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        config = function()
            require("github-theme").setup({
                -- ...
            })
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        enabled = false,
        name = "moonfly",
        lazy = false,
    },
    {
        "gmr458/vscode_modern_theme.nvim",
        enabled = true,
        lazy = false,
        config = function()
            require("vscode_modern").setup({
                cursorline = true,
                transparent_background = true,
                nvim_tree_darker = true,
            })
        end,
    },

    {
        "diegoulloao/neofusion.nvim",
        enabled = false,
        lazy = false,
        config = true,
        opts = ...,
    },
    {
        "shaunsingh/nord.nvim",
        enabled = false,
        lazy = false,
    },

    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        lazy = false,
    },
    {
        "sainnhe/sonokai",
        enabled = true,
        lazy = false,
        opt = {
        },
    },
    {
        "LazyVim/LazyVim",
        lazy = false,
        opts = {
            colorscheme = "sonokai",
            -- colorscheme = "github-theme"
        },
    },
    -- Lazy
}
