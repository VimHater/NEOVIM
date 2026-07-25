return {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            default_command = "",
            hidden_buffer = true,
            focus_compilation_buffer = true,
            use_circular_error_navigation = true,
            use_pseudo_terminal = false,
            input_word_completion = true,
        }
        vim.keymap.set("n", "<leader>ci", ":Compile<CR>", { desc = "Compile mode" })
    end,
}
