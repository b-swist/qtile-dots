local M = {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" }
}

function M.config()
    require("dashboard").setup({
        theme = "doom",
    })
end

return M
