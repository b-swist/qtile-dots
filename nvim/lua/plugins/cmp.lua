local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",

        "dcampos/nvim-snippy",
        "dcampos/cmp-snippy"
    }
}

function M.config()
    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                require("snippy").expand_snippet(args.body)
            end
        },
        -- window = {
        --     completion = cmp.config.window.bordered(),
        --     documentation = cmp.config.window.bordered()
        -- },
        mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "snippy" }
        }, {
            { name = "buffer" }
        })
    })

end

return M
