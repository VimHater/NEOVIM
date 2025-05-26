return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
        suggestion = {
            enabled = not vim.g.ai_cmp,
            -- enabled = false,
            auto_trigger = true,
            hide_during_completion = vim.g.ai_cmp,
            keymap = {
                accept = false, -- handled by nvim-cmp / blink.cmp
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        panel = { enabled = true },
        filetypes = {
            markdown = true,
            help = true,
        },
        logger = {
            file_log_level = vim.log.levels.OFF,
            print_log_level = vim.log.levels.OFF,
        },
    },
}
