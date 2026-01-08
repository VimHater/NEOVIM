return {
    {
        "okuuva/auto-save.nvim",
        enabled = false,
        -- enabled = vim.env.NOAUTOSAVE ~= "1",
        version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
        cmd = "ASToggle", -- optional for lazy loading on command
        event = { "TextChanged" }, -- optional for lazy loading on trigger events
        condition = function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")

            if
                fn.getbufvar(buf, "&modifiable") == 1
                -- change here is adding harpoon file type to exclusion list 
                and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon" })
            then
                return true
            end
            return false
        end,
        opts = {
            -- your config goes here
            -- or just leave it empty :)
            debounce_delay = 50,
        },
    },
}
