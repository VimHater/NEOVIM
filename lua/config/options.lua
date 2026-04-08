vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.g.snacks_animate = false
vim.g.autoformat = false
--vim.wo.signcolumn = "yes"
--vim.wo.relativenumber = true
vim.opt.sidescrolloff = 12
vim.opt.wrap = false
vim.o.updatetime = 500
vim.o.cmdheight = 0
vim.opt.termguicolors = true
vim.opt.conceallevel = 0
vim.keymap.set({ "t" }, "<M-Esc>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set({ "n" }, "<C-S-x>", [[:ToggleTerm<CR>]], { noremap = true })
vim.keymap.set({ "t" }, "<C-S-x>", [[<C-\><C-n>:q<CR>]], { noremap = true })
vim.keymap.set({ "t" }, "<C-c>", "<Nop>", { noremap = false })
vim.g.sonokai_transparent_background = 1

local function setup_statusline()
    local mode_map = {
        n  = { label = "NORMAL",   fg = "#282c34", bg = "#98c379" }, -- green
        i  = { label = "-- INSERT --",   fg = "#282c34", bg = "#61afef" }, -- blue
        v  = { label = "-- VISUAL --",   fg = "#282c34", bg = "#c678dd" }, -- purple
        V  = { label = "-- V-LINE --",   fg = "#282c34", bg = "#c678dd" }, -- purple
        c  = { label = "COMMAND",  fg = "#282c34", bg = "#e5c07b" }, -- yellow
        R  = { label = "REPLACE",  fg = "#282c34", bg = "#e06c75" }, -- red
        t  = { label = "TERMINAL", fg = "#282c34", bg = "#56b6c2" }, -- cyan
        [""] = { label = "V-BLOCK", fg = "#282c34", bg = "#c678dd" }, -- purple
    }

    -- create highlight groups from the map
    for key, m in pairs(mode_map) do
        local name = "StatusMode_" .. (key == "" and "vblock" or key)
        vim.api.nvim_set_hl(0, name, { fg = m.fg, bg = m.bg, bold = true })
        mode_map[key].hl = "%#" .. name .. "#"
    end

    function _G.my_statusline()
        local m = mode_map[vim.fn.mode()] or { label = vim.fn.mode(), hl = "%#StatusLine#" }
        local file = vim.fn.expand("%:~")
        local modified = vim.bo.modified and " [+]" or ""
        return string.format("%s %s %%#StatusLine# %s%s ", m.hl, m.label, file, modified)
    end

    vim.opt.statusline = "%!v:lua.my_statusline()"
end

setup_statusline()

vim.api.nvim_create_autocmd("ColorScheme", { callback = setup_statusline })

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
})

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
    vim.g.neovide_scroll_animation_length = 0
    vim.opt.linespace = 1
    vim.keymap.set({ "n", "v" }, "<C-S-c>", '"+y', { noremap = false, silent = true })
    vim.keymap.set({ "n", "v" }, "<C-S-v>", '"+p', { noremap = false, silent = true })
    vim.g.neovide_underline_stroke_scale = 1.0
end
