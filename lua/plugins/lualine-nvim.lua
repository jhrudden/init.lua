local config = function()
    local theme = require('lualine.themes.gruvbox_dark')
    theme.normal.c.bg = nil

    require('lualine').setup({
        options = {
            theme = theme,
            globalstatus = true,
        },
        sections = {
            lualine_a = {
                {
                    'buffers',
                },
            },
        }


    })
end


return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = config
}
