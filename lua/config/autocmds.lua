-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


-- local diagnostics_hidden = true -- Assume they start hidden based on your earlier setup
--
-- vim.api.nvim_create_user_command("ToggleDiagnostics", function()
--     if diagnostics_hidden then
--         -- 1. TURN ON: Re-enable default diagnostic displays
--         vim.diagnostic.config({
--             virtual_text = true, -- Default
--             signs = true, -- Default
--             underline = true, -- Default
--         })
--         diagnostics_hidden = false
--         print("Diagnostics Toggled ON: Virtual Text, Signs, and Underlines are visible.")
--     else
--         -- 2. TURN OFF: Apply your desired hidden state
--         vim.diagnostic.config({
--             virtual_text = false,
--             signs = false,
--             underline = false,
--         })
--         diagnostics_hidden = true
--         print("Diagnostics Toggled OFF: Virtual Text, Signs, and Underlines are hidden.")
--     end
-- end, {
--     desc = "Toggle all LSP diagnostic visual indicators (virtual text, signs, underline) On/Off.",
--     nargs = 0,
-- })


-- Disable interactive command mode
vim.g.cedit = "<Nul>"
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = vim.api.nvim_create_augroup("NoCommandWindow", { clear = true }),
  callback = function()
    vim.cmd('quit')
  end,
})
