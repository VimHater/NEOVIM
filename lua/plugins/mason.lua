return {
    {
        "mason-org/mason.nvim",
        --version = "^2.0.0",
        lazy = false,
        opts = {
            ensure_installed = {
                "bash-language-server",
                "clang-format",
                "clangd",
                "cmakelang",
                "cmakelint",
                "codelldb",
                "debugpy",
                "docker-compose-language-service",
                "dockerfile-language-server",
                "hadolint",
                "json-lsp",
                "lua-language-server",
                "neocmakelsp",
                "omnisharp",
                "stylua",
            },
        },
    },
}
