return {
    {
        "akinsho/toggleterm.nvim",
        enabled = true,
        lazy = false,
        version = "*",
        opts = {--[[ things you want to change go here]]
            autochdir = true,
            start_in_insert = false,
            close_on_exit = true, -- close the terminal window when the process exits
            direction = "float",
            auto_scroll = true, -- automatically scroll to the bottom on terminal output
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = "curved",
                -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
                width = 130,
                height = 30,
                winblend = 3,
            },
        },
    },
}
