return {
    -- {
    --     "williamboman/mason-lspconfig.nvim",
    --     ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "neomake", "python-lsp-server" },
    -- },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- Ensure mason installs the server
                clangd = {
                    keys = {
                        { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
                    },
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern(
                            "Makefile",
                            "configure.ac",
                            "configure.in",
                            "config.h.in",
                            "meson.build",
                            "meson_options.txt",
                            "build.ninja"
                        )(fname) or require("lspconfig.util").root_pattern(
                            "compile_commands.json",
                            "compile_flags.txt"
                        )(fname) or require("lspconfig.util").find_git_ancestor(fname)
                    end,
                    capabilities = {
                        offsetEncoding = { "utf-16" },
                    },
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        --"--completion-style=bundled",
                        -- "--function-arg-placeholders",
                        -- "--fallback-style=google",
                        "--pch-storage=memory",
                        "--j=8", -- Reduced from 8 to prevent memory pressure
                        "--malloc-trim",
                        --"--limit-results=30", -- Limit completion items for speed
                        --"--limit-references=20",
                        "--inlay-hints=true", -- Disable inlay hints for better performance
                        -- "--header-insertion-decorators=false",
                        "--ranking-model=decision_forest", -- Better ranking algorithm
                        -- "--query-driver=/usr/bin/**/clang-*,/bin/clang,/usr/bin/clang", -- Add appropriate paths for your system
                        -- "--log=error", -- Reduce logging overhead
                        -- "--enable-config", -- Enable .clangd config files
                        "--offset-encoding=utf-16",
                    },
                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                },
            },
            -- example calling setup directly for each LSP
            config = function()
                local capabilities = require("blink.cmp").get_lsp_capabilities()
                local lspconfig = require("lspconfig")

                lspconfig["lua_ls"].setup({ capabilities = capabilities })
                lspconfig["clangd"].setup({ capabilities = capabilities })
                lspconfig["bacon_ls"].setup({ capabilities = capabilities })
                lspconfig["bacon"].setup({ capabilities = capabilities })
                lspconfig["rust_analyzer"].setup({
                    capabilities = capabilities,
                    diagnostics = { enable = false },
                    checkOnSave = { enable = false },
                })
            end,
        },
    },
}
