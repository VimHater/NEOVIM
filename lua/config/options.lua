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
vim.lsp.config["*"] = {
    autostart = false,
}
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

-- vim.keymap.set('v', '<leader>r', function()
--     -- 1. Yank the visual selection into the 's' register
--     vim.cmd('normal! "sy')
--     local query = vim.fn.getreg('s')
--
--     -- 2. Build the command string
--     -- We use vim.fn.shellescape to handle quotes and special characters safely
--     local cmd = string.format(
--         "sqlcmd -S 127.0.0.1,1433 -U sa -P 'Password.1' -C -Q %s",
--         vim.fn.shellescape(query)
--     )
--
--     -- 3. Run the command and show output in a new split buffer
--     -- This keeps your UI clean and lets you scroll through results
--     vim.cmd("new | setlocal buftype=nofile bufhidden=hide noswapfile")
--     vim.fn.termopen(cmd)
-- end, { desc = 'Run highlighted SQL query' })

vim.keymap.set('v', '<leader>r', function()
    -- 1. Yank selection to 's' register
    vim.cmd('normal! "sy')
    local query = vim.fn.getreg('s')

    -- 2. Build the command string
    local cmd = string.format(
        "sqlcmd -S 127.0.0.1,1433 -U sa -P 'Password.1' -C -Q %s",
        vim.fn.shellescape(query)
    )

    -- 3. Open a horizontal split at the bottom
    vim.cmd("botright 15new") 
    
    -- 4. Set buffer options correctly
    local buf = vim.api.nvim_get_current_buf()
    
    -- In Lua, we use the property name 'swapfile' and set it to false
    vim.bo[buf].swapfile = false   -- This replaces 'noswapfile'
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe" -- Deletes buffer when window closes
    vim.bo[buf].buflisted = false  -- Prevents it from appearing in tab bar
    
    -- 5. Add a 'q' shortcut to close this specific window easily
    vim.keymap.set('n', 'q', ':close<CR>', { buffer = buf, silent = true })

    -- 6. Execute the command in the terminal buffer
    vim.fn.termopen(cmd)
end, { desc = 'Run SQL and clean up buffer' })

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

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
})
-- vim.api.nvim_create_user_command(
--     "ShowDiag",
--     function()
--         local isLspDiagnosticsVisible = false
--         print("Disabled lsp")
--         isLspDiagnosticsVisible = not isLspDiagnosticsVisible
--         vim.diagnostic.config({
--             virtual_text = isLspDiagnosticsVisible, -- Hides text, but keeps signs/underline if enabled
--             signs = isLspDiagnosticsVisible,
--             underline = isLspDiagnosticsVisible,
--         })
--     end,
--     {
--         desc = "Toggle Lsp Diagnostics",
--     }
-- )

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
