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
        opts = { style = "night" },
    },

    {
        "vague2k/vague.nvim",
        enabled = true,
        config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("vague").setup({
                transparent = false, -- don't set background
                -- disable bold/italic globally in `style`
                bold = true,
                italic = true,
                style = {
                    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
                    boolean = "bold",
                    number = "none",
                    float = "none",
                    error = "bold",
                    comments = "italic",
                    conditionals = "none",
                    functions = "none",
                    headings = "bold",
                    operators = "none",
                    strings = "italic",
                    variables = "none",

                    -- keywords
                    keywords = "none",
                    keyword_return = "italic",
                    keywords_loop = "none",
                    keywords_label = "none",
                    keywords_exception = "none",

                    -- builtin
                    builtin_constants = "bold",
                    builtin_functions = "none",
                    builtin_types = "bold",
                    builtin_variables = "none",
                },
                -- plugin styles where applicable
                -- make an issue/pr if you'd like to see more styling options!
                plugins = {
                    cmp = {
                        match = "bold",
                        match_fuzzy = "bold",
                    },
                    dashboard = {
                        footer = "italic",
                    },
                    lsp = {
                        diagnostic_error = "bold",
                        diagnostic_hint = "none",
                        diagnostic_info = "italic",
                        diagnostic_ok = "none",
                        diagnostic_warn = "bold",
                    },
                    neotest = {
                        focused = "bold",
                        adapter_name = "bold",
                    },
                    telescope = {
                        match = "bold",
                    },
                },

                -- Override highlights or add new highlights
                on_highlights = function(highlights, colors) end,

                -- Override colors
                -- colors = {
                --     --bg = "#141415",
                --     bg = "#111111",
                --     fg = "#FFFFFF",
                --     floatBorder = "#878787",
                --     line = "#252530",
                --     comment = "#606079",
                --     builtin = "#b4d4cf",
                --     func = "#c48282",
                --     string = "#e8b589",
                --     number = "#e0a363",
                --     property = "#c3c3d5",
                --     constant = "#aeaed1",
                --     parameter = "#bb9dbd",
                --     visual = "#333738",
                --     error = "#d8647e",
                --     warning = "#f3be7c",
                --     hint = "#7e98e8",
                --     operator = "#90a0b5",
                --     keyword = "#6e94b2",
                --     type = "#9bb4bc",
                --     search = "#405065",
                --     plus = "#7fa563",
                --     delta = "#f3be7c",
                -- },
                colors = {
                    bg = "#282c34", -- OneDark background
                    fg = "#abb2bf", -- Default foreground
                    floatBorder = "#3e4452", -- Slightly brighter than bg
                    line = "#3e4452", -- Same as floatBorder
                    comment = "#5c6370", -- Muted grey
                    builtin = "#56b6c2", -- Cyan-like
                    func = "#61afef", -- Blue
                    string = "#98c379", -- Green
                    number = "#d19a66", -- Orange
                    property = "#c678dd", -- Purple
                    constant = "#d19a66", -- Same as number
                    parameter = "#e5c07b", -- Yellowish
                    visual = "#3e4452", -- Visual mode bg
                    error = "#e06c75", -- Red
                    warning = "#e5c07b", -- Yellow
                    hint = "#56b6c2", -- Cyan
                    operator = "#56b6c2", -- Cyan
                    keyword = "#c678dd", -- Purple
                    type = "#e5c07b", -- Yellow
                    search = "#3e4452", -- Background for search highlight
                    plus = "#98c379", -- Green (additions)
                    delta = "#d19a66", -- Orange (changes)
                },
            })
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        enabled = false,
        lazy = false,
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
        enabled = false,
        lazy = false,
        config = function()
            require("vscode_modern").setup({
                cursorline = true,
                transparent_background = false,
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
        enabled = false,
        lazy = false,
    },
    {
        "sainnhe/sonokai",
        enabled = true,
        lazy = false,
    },
    {
        "LazyVim/LazyVim",
        lazy = false,
        opts = {
            colorscheme = "sonokai",
        },
    },
    -- Lazy
}
