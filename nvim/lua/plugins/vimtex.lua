local M = {
    "lervag/vimtex",
    lazy = false,
}

function M.init()
    vim.g.vimtex_view_method = "zathura"
    -- vim.o.conceallevel = 1
    -- vim.g.tex_conceal = "abmg"
    vim.g.vimtex_compiler_latexmk = {
        aux_dir = "aux",
        out_dir = "out"
    }
end

return M
