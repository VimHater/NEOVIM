-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.keymap.set({ "n", "v" }, "<leader>cb", function()
    if vim.opt.clipboard:get()[1] == "unnamedplus" then
        vim.opt.clipboard = "unnamed"
        print("Clipboard: unnamed (Primary Selection)")
    else
        vim.opt.clipboard = "unnamedplus"
        print("Clipboard: unnamedplus (System Clipboard)")
    end
end, { desc = "Toggle clipboard between unnamed and unnamedplus" })

local lazy_lsp_config_group = vim.api.nvim_create_augroup("LazyDiagnosticConfigOnce", { clear = true })

-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = lazy_lsp_config_group,
--     -- Pattern '*' means this fires for any buffer that an LSP attaches to
--     pattern = "*",
--     callback = function()
--         -- Apply the global diagnostic configuration
--         vim.diagnostic.config({
--             virtual_text = false,
--             signs = false,
--             underline = false,
--         })
--
--         -- IMPORTANT: Delete the autocommand immediately after running it
--         -- so it only configures diagnostics once, not every time a new server attaches.
--         vim.api.nvim_del_augroup_by_id(lazy_lsp_config_group)
--     end,
-- })

-- Define a variable to track the current state of the diagnostics
local diagnostics_hidden = true -- Assume they start hidden based on your earlier setup

vim.api.nvim_create_user_command("ToggleDiagnostics", function()
    if diagnostics_hidden then
        -- 1. TURN ON: Re-enable default diagnostic displays
        vim.diagnostic.config({
            virtual_text = true, -- Default
            signs = true, -- Default
            underline = true, -- Default
        })
        diagnostics_hidden = false
        print("Diagnostics Toggled ON: Virtual Text, Signs, and Underlines are visible.")
    else
        -- 2. TURN OFF: Apply your desired hidden state
        vim.diagnostic.config({
            virtual_text = false,
            signs = false,
            underline = false,
        })
        diagnostics_hidden = true
        print("Diagnostics Toggled OFF: Virtual Text, Signs, and Underlines are hidden.")
    end
end, {
    desc = "Toggle all LSP diagnostic visual indicators (virtual text, signs, underline) On/Off.",
    nargs = 0,
})

-- local group = vim.api.nvim_create_augroup('autosave', {})
--
-- vim.api.nvim_create_autocmd('User', {
--     pattern = 'AutoSaveWritePost',
--     group = group,
--     callback = function(opts)
--         if opts.data.saved_buffer ~= nil then
--             local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
--             vim.notify('AutoSave: saved ' .. filename .. ' at ' .. vim.fn.strftime('%H:%M:%S'), vim.log.levels.INFO)
--         end
--     end,
-- })
