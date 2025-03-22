-- --for Wayland
-- vim.g.clipboard = {
--   name = "wl-clipboard",
--   copy = {
--     ["+"] = "wl-copy",
--     ["*"] = "wl-copy",
--   },
--   paste = {
--     ["+"] = "wl-paste",
--     ["*"] = "wl-paste",
--   },
--   cache_enabled = true,
-- }
-- -- Set clipboard option
-- vim.opt.clipboard = ""
-- --
-- vim.keymap.set(
--   { "n", "v", "i", "c" },
--   "<C-S-c>",
--   '"+y',
--   { noremap = true, silent = true, desc = "Copy to system clipboard" }
-- )

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
--vim.g.snacks_animate = false
vim.g.autoformat = false
--vim.wo.signcolumn = "yes"
vim.wo.relativenumber = true
vim.opt.sidescrolloff = 12
vim.opt.wrap = true
vim.opt.termguicolors = false
-- enabled with `:LazyExtras`
