vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.g.snacks_animate = false
vim.g.autoformat = false
--vim.wo.signcolumn = "yes"
--vim.wo.relativenumber = true
vim.opt.sidescrolloff = 12
vim.opt.wrap = false
vim.o.updatetime = 500
vim.o.cmdheight = 1
vim.opt.termguicolors = true
vim.opt.conceallevel = 0
vim.opt.swapfile = false
vim.opt.cmdheight = 1

local function setup_statusline()
    -- vim.api.nvim_set_hl(0, "StatusLine",   { fg = "#FFFFFF", bg = "#1F1F1E" })
    -- vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#565b66", bg = "#1F1F1E" })
    -- vim.api.nvim_set_hl(0, "StatusLineExtra", { fg = "#565b66", bg = "#131721" })
    vim.api.nvim_set_hl(0, "StatusLine",   { fg = "#000000", bg = "#e5c07f" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#565b66", bg = "#1F1F1E" })
    local mode_map = {
        n = { label = "N", fg = "#282c34", bg = "#98c379" },
        i = { label = "I", fg = "#282c34", bg = "#61afef" },
        v = { label = "V", fg = "#282c34", bg = "#c678dd" },
        V = { label = "V-LINE", fg = "#282c34", bg = "#c678dd" },
        c = { label = "C", fg = "#282c34", bg = "#ffc07b" },
        R = { label = "R", fg = "#282c34", bg = "#e06c75" },
        t = { label = "T", fg = "#282c34", bg = "#56b6c2" },
        CTRL_V = { label = "V-BLOCK", fg = "#282c34", bg = "#c678dd" },
    }
    -- local mode_map = {
    --     n      = { label = "N",       fg = "#000000", bg = "#7fd962" }, -- ayu green
    --     i      = { label = "I",       fg = "#000000", bg = "#59c2ff" }, -- ayu blue
    --     v      = { label = "V",       fg = "#000000", bg = "#d2a6ff" }, -- ayu purple
    --     V      = { label = "V-LINE",  fg = "#000000", bg = "#d2a6ff" },
    --     c      = { label = "C",       fg = "#000000", bg = "#e6b450" }, -- ayu yellow (matches statusline)
    --     R      = { label = "R",       fg = "#000000", bg = "#f07178" }, -- ayu red
    --     t      = { label = "T",       fg = "#000000", bg = "#39bae6" }, -- ayu cyan
    --     CTRL_V = { label = "V-BLOCK", fg = "#000000", bg = "#d2a6ff" },
    -- }
    for key, m in pairs(mode_map) do
        local name = "StatusMode_" .. key
        vim.api.nvim_set_hl(0, name, { fg = m.fg, bg = m.bg, bold = true })
        mode_map[key].hl = "%#" .. name .. "#"
    end
    function _G.my_statusline()
        local raw_mode = vim.fn.mode(1)
        local key = raw_mode == "\22" and "CTRL_V" or raw_mode
        if raw_mode:sub(1, 1) == "V" then key = "V" end
        if raw_mode:sub(1, 1) == "v" then key = "v" end
        if raw_mode:sub(1, 1) == "\22" then key = "CTRL_V" end
        local m = mode_map[key] or { label = raw_mode, hl = "%#StatusLine#" }

        local file = vim.fn.expand("%:t")
        local modified = vim.bo.modified and " [+]" or ""
        local left = string.format("%s %s %%#StatusLine# %s%s", m.hl, m.label, file, modified)

        -- right side: only in visual modes
        local right = ""
        local mode_char = raw_mode:sub(1, 1)
        if mode_char == "v" or mode_char == "V" or mode_char == "\22" then
            local from = vim.fn.getpos("v")
            local to   = vim.fn.getpos(".")
            local from_line, from_col = from[2], from[3]
            local to_line,   to_col   = to[2],   to[3]
            if from_line > to_line or (from_line == to_line and from_col > to_col) then
                from_line, to_line = to_line, from_line
                from_col,  to_col  = to_col,  from_col
            end
            local lines = to_line - from_line + 1
            local words = vim.fn.wordcount().visual_words or 0
            local bytes = vim.fn.wordcount().visual_bytes or 0
            local total_lines = vim.fn.line("$")
            local pct = math.floor(vim.fn.line(".") / total_lines * 100)
            right = string.format(
                "%%#StatusLineExtra# %dL  %dW  %dB  %d%%%% ", lines, words, bytes, pct)
        else
            local total_lines = vim.fn.line("$")
            local pct = math.floor(vim.fn.line(".") / total_lines * 100)
            right = string.format(
                "%%#StatusLineExtra# %d%%%% ", pct)
        end

        return left .. "%=" .. right
    end
    vim.opt.statusline = "%!v:lua.my_statusline()"
    vim.api.nvim_create_autocmd("ModeChanged", {
        callback = function()
            vim.schedule(function()
                if vim.api.nvim_get_mode().mode ~= "c" then
                    vim.cmd("redrawstatus")
                end
            end)
        end,
    })
end
setup_statusline()

vim.cmd("set listchars=tab:>-,trail:-")
vim.cmd("set list")
vim.api.nvim_create_autocmd("ColorScheme", { callback = setup_statusline })


vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
})

if vim.g.neovide then
    vim.keymap.set({'i', 'n'}, '<C-S-v>', '<C-r>+', { noremap = true, silent = true })
    vim.keymap.set('c', '<C-S-v>', '<C-r>+', { noremap = true })

    vim.opt.linespace = 3
    vim.g.neovide_input_ime = true
    vim.g.neovide_cursor_cell_color_fallback = false

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    vim.g.neovide_scale_factor = 1
    vim.g.neovide_cursor_trail_size = 0.8
    vim.g.neovide_cursor_smooth_blink = true

    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
            vim.api.nvim_set_hl(0, "Cursor", { fg = "#FFFFFF", bg = "#F29718" })
        end,
    })
    vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

    local function adjust_scale(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
    end

    vim.keymap.set({ 'n', 'i', 'v' }, '<C-=>', function() adjust_scale(0.1) end, { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<C-->', function() adjust_scale(-0.1) end, { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<C-0>', function() vim.g.neovide_scale_factor = 1.0 end, { noremap = true, silent = true })
end
