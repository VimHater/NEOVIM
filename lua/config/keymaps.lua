-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up in Visual Mode" })
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down in Visual Mode" })
vim.keymap.set({ "n" }, "<leader><C-a>", "ggVG", { desc = "select all", noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader><C-y>", "ggyG", { desc = "yank all", noremap = true, silent = true })
vim.keymap.set('n', 'q:', '<nop>', { desc = "disbable interactive command mode", silent = true })
vim.keymap.set({ "t" }, "<Esc>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set({ "t" }, "<C-c>", "<Nop>", { noremap = false })
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Open oil" })
vim.keymap.set("n", "<C-q>", ":q<CR>", { desc = "close" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-q>", "<C-w>c", { desc = "Close window" })

vim.keymap.set("n", "gl", "$", { desc = "goto EOL" })
vim.keymap.set("n", "gL", "0", { desc = "goto start of line" })

local readline = require 'readline'
vim.keymap.set('!', '<M-f>', readline.forward_word)
vim.keymap.set('!', '<M-b>', readline.backward_word)
vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
vim.keymap.set('!', '<C-e>', readline.end_of_line)
vim.keymap.set('!', '<M-d>', readline.kill_word)
vim.keymap.set('!', '<M-BS>', readline.backward_kill_word)
vim.keymap.set('!', '<C-w>', readline.unix_word_rubout)
vim.keymap.set('!', '<C-k>', readline.kill_line)
vim.keymap.set('!', '<C-u>', readline.backward_kill_line)

vim.keymap.set({ "n", "v" }, "<C-e>", "$", { desc = "Jump to EOL" })
vim.keymap.set({ "n", "v" }, "<C-o>", "0", { desc = "Jump to SOL" })
