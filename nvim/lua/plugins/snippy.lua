local M = {
    "dcampos/nvim-snippy",
    dependencies = {
        "honza/vim-snippets"
    }
}

function fname(...)
    
end

function M.config()
    require("snippy").setup({
        mappings = {
            is = {
                ["<CR>"] = "expand_or_advance",
                ["<S-CR>"] = "previous"
            }
        }
    })
end

return M
