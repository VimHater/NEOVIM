-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.cmd("Copilot disable")
vim.keymap.set({ "n", "v" }, "<leader>cb", function()
    if vim.opt.clipboard:get()[1] == "unnamedplus" then
        vim.opt.clipboard = "unnamed"
        print("Clipboard: unnamed (Primary Selection)")
    else
        vim.opt.clipboard = "unnamedplus"
        print("Clipboard: unnamedplus (System Clipboard)")
    end
end, { desc = "Toggle clipboard between unnamed and unnamedplus" })
