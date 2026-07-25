return {
    'mg979/vim-visual-multi',
    lazy = false,
    init = function()
        -- Skip conflict check so VM overrides existing [ ] <Tab> maps in its buffer mode.
        -- Silences "b1: Could not map: ..." warnings.
        vim.g.VM_check_mappings = 0
        -- Mimic Helix cursor creation:
        --   C     -> add cursor on line below (Helix "copy selection to next line")
        --   Alt-C -> add cursor on line above
        --   Ctrl-n-> still select next occurrence of word (Find Under)
        vim.g.VM_maps = {
            ["Add Cursor Down"] = "C",
            ["Add Cursor Up"]   = "<M-C>",
            ["Find Under"]      = "<C-n>",
            ["Find Subword Under"] = "<C-n>",
        }

        -- Helix-like indent: run >> / << on every cursor's line (no need for V).
        vim.g.VM_custom_noremaps = {
            [">"] = ">>",
            ["<"] = "<<",
        }

        -- onedark defines no VM_* groups, so secondary cursors are invisible
        -- in insert mode. Force visible highlights, re-apply after any colorscheme.
        local function vm_hl()
            vim.api.nvim_set_hl(0, "VM_Mono", { fg = "#282C34", bg = "#F29718" })
            vim.api.nvim_set_hl(0, "VM_Cursor", { fg = "#282C34", bg = "#F29718" })
            -- Insert-mode cursors link to VM_Insert. Secondary cursors are cell
            -- highlights, so no vertical-bar option -- block is the closest match.
            vim.api.nvim_set_hl(0, "VM_Insert", { fg = "#282C34", bg = "#F29718" })
            vim.api.nvim_set_hl(0, "VM_Extend", { link = "Visual" })
        end
        vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = vm_hl })
        vm_hl()

        -- Helix-like: enter extend mode when VM starts, so motions
        -- (w e $ l ...) extend the selection at every cursor by default.
        vim.api.nvim_create_autocmd("User", {
            pattern = "visual_multi_start",
            callback = function()
                if vim.b.VM_Selection and not vim.tbl_isempty(vim.b.VM_Selection) then
                    vim.cmd("silent! call b:VM_Selection.Global.extend_mode()")
                end
                vim.g.vm_active = true
                vim.cmd("redrawstatus")
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "visual_multi_exit",
            callback = function()
                vim.g.vm_active = false
                vim.cmd("redrawstatus")
            end,
        })
    end
}
