local M = {
    "williamboman/mason.nvim",
    dependencies = {
        -- lsp
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",

        -- autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",

        -- snippets
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets"
    }
}

M.servers = {
    "lua_ls",
    "pylsp",
}

function M.config()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = M.servers,
        automatic_installation = true
    })

    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
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
            { name = "luasnip" },
        })
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig").lua_ls.setup {
        capabilities = capabilities
    }
    require("lspconfig").pylsp.setup {
        capabilities = capabilities
    }
end

return M
