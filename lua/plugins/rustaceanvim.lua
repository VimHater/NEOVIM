return {
    -- Rust diagnostics via bacon-ls instead of rust-analyzer's on-save cargo
    -- check. bacon runs in the background and reruns fast, so errors refresh
    -- automatically without a manual re-trigger. rust-analyzer keeps the rest
    -- of LSP (completion, hover, goto, etc).
    {
        "mrcjkb/rustaceanvim",
        opts = {
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = false,
                        diagnostics = {
                            enable = false,
                        },
                    },
                },
            },
        },
    },
}
