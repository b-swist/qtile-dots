local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" }
}

function M.config()
    require("nvim-autopairs").setup()
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

    local Rule = require("nvim-autopairs.rule")
    require("nvim-autopairs").add_rules({
        Rule("$", "$", "tex"):with_move(function(opts) return opts.next_char == opts.char end)
    })
end

return M
