local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" }
}

function M.config()
    require("nvim-autopairs").setup()
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return M
