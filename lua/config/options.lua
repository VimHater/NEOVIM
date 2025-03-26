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
vim.g.snacks_animate = false
vim.g.autoformat = false
--vim.wo.signcolumn = "yes"
vim.wo.relativenumber = true
vim.opt.sidescrolloff = 12
vim.opt.wrap = false
--vim.opt.termguicolors = false
-- enabled with `:LazyExtras`
--vim.o.scrolloff = 999
-- vim.api.nvim_create_autocmd("CursorMoved", {
--   pattern = "*",
--   command = "normal! zz",
-- })

if vim.g.neovide then
    -- Set font
    vim.o.guifont = "JetbrainsMono Nerd Font:s16"

    vim.g.neovide_transparency = 1

    vim.g.neovide_scale_factor = 1

    --vim.g.neovide_cursor_vfx_mode = "railgun"

    vim.g.neovide_scroll_animation_length = 0.3
end
