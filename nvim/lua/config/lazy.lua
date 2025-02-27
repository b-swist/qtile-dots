local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
    -- -- {
    -- --     "williamboman/mason.nvim",
    -- --     dependencies = {
    -- --         "williamboman/mason-lspconfig.nvim",
    -- --         "neovim/nvim-lspconfig"
    -- --     }
    -- -- },
    --
    -- -- {
    -- --     "hrsh7th/nvim-cmp",
    -- --     dependencies = {
    -- --         "hrsh7th/cmp-nvim-lsp",
    -- --         "hrsh7th/cmp-buffer",
    -- --         "hrsh7th/cmp-path",
    -- --         "hrsh7th/cmp-cmdline",
    -- --         "L3MON4D3/LuaSnip",
    -- --     },
    -- --     -- config = function()
    -- --     --     require("plugins.nvim-cmp")
    -- --     -- end,
    -- -- },
    -- -- {
    -- --     "windwp/nvim-autopairs",
    -- --     event = "InsertEnter",
    -- --     -- config = true
    -- --     -- use opts = {} for passing setup options
    -- --     -- this is equivalent to setup({}) function
    -- -- },
    --
    -- {

