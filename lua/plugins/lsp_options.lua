return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = { enabled = false },
    },
    require('lspconfig').rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
        diagnostics = {
            experimental = {
            enable = true,
            },
        },
        },
    },
    })
}
