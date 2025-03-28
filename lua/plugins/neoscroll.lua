if vim.g.neovide then
    return {}
end
return {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
        require("neoscroll").setup({})
    end,
}
