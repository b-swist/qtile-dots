local M = {
    "dcampos/nvim-snippy",
    -- dependencies = { "honza/vim-snippets" }
}

function M.config()
    require("snippy").setup({
        mappings = {
            is = {
                ["<Tab>"] = "expand_or_advance",
                ["<S-Tab>"] = "previous"
            }
        }
    })
end

return M
