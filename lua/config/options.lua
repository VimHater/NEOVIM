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
vim.g.copilot_enabled = false
vim.g.snacks_animate = false
vim.g.autoformat = false
--vim.wo.signcolumn = "yes"
--vim.wo.relativenumber = true
vim.opt.sidescrolloff = 12
vim.opt.wrap = false
vim.o.updatetime = 500
vim.o.cmdheight = 0
vim.opt.termguicolors = true
vim.cmd("set nospell")
-- enabled with `:LazyExtras`
--vim.o.scrolloff = 999
-- vim.api.nvim_create_autocmd("CursorMoved", {
--   pattern = "*",
--   command = "normal! zz",
-- })
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_markdown_css = ""
vim.g.mkdp_preview_options = {
    mkit = {
        katex = {
            enabled = true,
        },
    },
}

vim.keymap.set({ "t" }, "<M-Esc>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set({ "n" }, "<C-S-x>", [[:ToggleTerm<CR>]], { noremap = true })
vim.keymap.set({ "t" }, "<C-S-x>", [[<C-\><C-n>:q<CR>]], { noremap = true })
vim.keymap.set({ "t" }, "<C-c>", "<Nop>", { noremap = false })
vim.g.sonokai_transparent_background = 1
-- function _G.toggle_sonokai_transparency()
--     _G.sonokai_transparent_enabled = not _G.sonokai_transparent_enabled
--
--     vim.g.sonokai_transparent_background = _G.sonokai_transparent_enabled and 1 or 0
--
--     vim.cmd("colorscheme sonokai")
--
--     print("Sonokai transparency " .. (_G.sonokai_transparent_enabled and "enabled" or "disabled"))
-- end

-- vim.api.nvim_create_user_command("ToggleSonokaiTransparent", toggle_sonokai_transparency, {})

if vim.g.neovide then
    -- Set font
    vim.o.guifont = "JetbrainsMono Nerd Font:h14"

    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_floating_blur_amount_x = 0
    vim.g.neovide_floating_blur_amount_y = 0
    --vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    vim.g.neovide_opacity = 1
    vim.g.neovide_floating_shadow = false
    vim.g.neovide_scroll_animation_length = 0.3
    vim.opt.linespace = 1
    vim.keymap.set({ "n", "v" }, "<C-S-c>", '"+y', { noremap = true, silent = true })
    vim.keymap.set({ "n", "v" }, "<C-S-v>", '"+p', { noremap = true, silent = true })
end
