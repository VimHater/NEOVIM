local diagnostics_hidden = true

vim.api.nvim_create_user_command("ToggleDiagnostics", function()
    if diagnostics_hidden then
        vim.diagnostic.config({
            virtual_text = true, -- Default
            signs = true, -- Default
            underline = true, -- Default
        })
        diagnostics_hidden = false
        print("Diagnostics Toggled ON: Virtual Text, Signs, and Underlines are visible.")
    else
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

-- Disable interactive command mode
vim.g.cedit = "<Nul>"
vim.api.nvim_create_autocmd("CmdwinEnter", {
    group = vim.api.nvim_create_augroup("NoCommandWindow", { clear = true }),
    callback = function()
        vim.cmd("quit")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*.md", "markdown" }, -- filetypes to disable for
    callback = function()
        vim.opt_local.spell = false
        vim.cmd("RenderMarkdown buf_disable")
    end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         vim.opt.statusline = "ABOBA"
--     end,
-- })
