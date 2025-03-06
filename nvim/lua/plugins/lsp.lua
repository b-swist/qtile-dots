local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp"
    }
}

M.servers = {
    "lua_ls",
    "pylsp"
}

function M.config()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = M.servers,
        automatic_installation = true
    })

    local lspconfig = require("lspconfig")

    for _, server in ipairs(M.servers) do
        lspconfig[server].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities()
        })
    end

    lspconfig.lua_ls.setup({
        settings = { Lua = { diagnostics = { globals = { "vim" } } } }
    })

end

return M
