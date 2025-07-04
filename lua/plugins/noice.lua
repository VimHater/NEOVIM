return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = false,
            },
        },
        -- routes = {
        --     {
        --         filter = {
        --             event = "msg_show",
        --             any = {
        --                 { find = "%d+L, %d+B" },
        --                 { find = "; after #%d+" },
        --                 { find = "; before #%d+" },
        --             },
        --         },
        --         view = "mini",
        --     },
        -- },
        presets = {
            bottom_search = true,
            command_palette = false,
            long_message_to_split = true,
        },
        cmdline = {
            enabled = true,
            view = "cmdline",
        },
    },
}
