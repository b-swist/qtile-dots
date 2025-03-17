is_android = ( function()
    local handle = io.popen("uname -o")
    local result = handle:read("*a")
    handle:close()
    return result:match("Android") ~= nil
end )()

require("config.opts")
require("config.keymaps")
require("config.lazy")

if not is_android then
    vim.cmd("colorscheme catppuccin")
else
    vim.cmd("colorscheme gruvbox-material")
end
