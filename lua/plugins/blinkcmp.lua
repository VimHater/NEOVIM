return {
    "saghen/blink.cmp",
    enabled = true,
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",
    lazy = false,
    -- use a release tag to download pre-built binaries
    version = "*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',
    ---@module 'blink.cmp'

    opts = {
        snippets = {
            expand = function(snippet, _)
                return LazyVim.cmp.expand(snippet)
            end,
        },
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-e: Hide menu
        -- C-k: Toggle signature help
        -- See the full "keymap" documentation for information on defining your own keymap.
        completion = {
            accept = {
                -- experimental auto-brackets support
                auto_brackets = {
                    enabled = true,
                },
            },
            ghost_text = { enabled = false },
            list = {
                selection = {
                    auto_insert = false,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 1000,
            },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
        },

        keymap = {
            preset = "default",
            ["<M-j>"] = { "select_next", "fallback" },
            ["<M-k>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "select_and_accept", "fallback_to_mappings" },
            ["<Tab>"] = { "select_and_accept", "fallback_to_mappings" },
            ["<C-b>"] = { "snippet_backward", "fallback_to_mappings" },
            ["<C-n>"] = { "snippet_forward", "fallback_to_mappings" },
            ["<C-h>"] = { "hide", "fallback"},
            ["<C-d>"] = { "show_documentation", "fallback"},
        },
        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = false,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "Nerd Font Mono",
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            --default = { 'lsp', 'path', 'snippets', 'buffer' },
            default = { "lsp", "snippets", "path", "buffer" },
        },

        -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "rust" },
    },
    opts_extend = { "sources.default" },
}
