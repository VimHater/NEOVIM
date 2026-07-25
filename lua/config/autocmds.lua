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

vim.api.nvim_create_user_command("NvideTransparentEnable", function()
    if vim.g.neovide then
        vim.g.neovide_normal_opacity = 0.5
    end
end, {
    desc = "Enable transparency for neovide",
})

vim.api.nvim_create_user_command("NvideTransparentDisable", function()
    if vim.g.neovide then
        vim.g.neovide_normal_opacity = 1
    end
end, {
    desc = "Disable transparency for neovide",
})

vim.api.nvim_create_user_command("ShowListChars", function()
    vim.cmd("set listchars=eol:$,tab:>-,trail:_,extends:>,precedes:<,space:·")
    vim.cmd("set list")
end, {
    desc = "show list chars",
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

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "*.md", "markdown" }, -- filetypes to disable for
--     callback = function()
--         vim.opt_local.spell = false
--         vim.cmd("RenderMarkdown buf_disable")
--     end,
-- })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function(ev)
        -- Skip big buffers: the :%s regex over the whole file makes saving laggy.
        if vim.b[ev.buf].bigfile or vim.api.nvim_buf_line_count(ev.buf) > 20000 then
            return
        end
        -- Trim trailing whitespace without touching search history / cursor.
        local lines = vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)
        local changed = false
        for i, line in ipairs(lines) do
            local trimmed = line:gsub("%s+$", "")
            if trimmed ~= line then
                lines[i] = trimmed
                changed = true
            end
        end
        if changed then
            vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, lines)
        end
    end,
})
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         vim.opt.statusline = "ABOBA"
--     end,
-- })
-- fcitx toggle: async via vim.system so mode changes never block the UI
local fcitx_prev_state = "1"

vim.system({ "fcitx5-remote" }, { text = true }, function(o)
    fcitx_prev_state = (o.stdout or ""):gsub("%s+", "")
end)
vim.system({ "fcitx5-remote", "-c" })

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { "*:n", "i:c", "R:c", "v:c", "V:c" },
    callback = function()
        vim.system({ "fcitx5-remote" }, { text = true }, function(o)
            local state = (o.stdout or ""):gsub("%s+", "")
            if state == "2" then
                fcitx_prev_state = "2"
                vim.system({ "fcitx5-remote", "-c" })
            else
                fcitx_prev_state = "1"
            end
        end)
    end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { "n:i", "n:R", "n:v", "n:V", "c:i", "c:R" },
    callback = function()
        if fcitx_prev_state == "2" then
            vim.system({ "fcitx5-remote", "-o" })
        end
    end,
})

