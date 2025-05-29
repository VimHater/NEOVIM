-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up in Visual Mode" })
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down in Visual Mode" })
vim.keymap.set({ "n" }, "<leader>c<C-a>", "ggVG", { desc = "select all", noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>c<C-y>", "ggyG", { desc = "yank all", noremap = true, silent = true })
