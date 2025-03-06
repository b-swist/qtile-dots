local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python" },
        highlight = {
            enable = true,
            disable = { "latex" }
        }
    })
end

return M
