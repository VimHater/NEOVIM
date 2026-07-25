return {
    {
        "folke/ts-comments.nvim",
        enabled = false,
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = false,
    },
    {
        "catppuccin/nvim",
        enabled = false,
    },
    {
        "folke/snacks.nvim",
        opts = {
            explorer = { enabled = false },
            -- Kick in the big-file guard much earlier than the 1.5MB default.
            -- Disables treesitter highlight, syntax, folds, conceal, etc. for
            -- big / long-line buffers so opening them is not laggy.
            bigfile = {
                enabled = true,
                notify = false,
                size = 256 * 1024, -- 256 KB
                line_length = 1000, -- also trip on very long single lines
            },
        },
    },
}
