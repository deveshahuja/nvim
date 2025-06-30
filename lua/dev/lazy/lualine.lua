return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            sections = {
                lualine_a = {'branch', 'diff', 'diagnostics'},
                lualine_b = {
                    {
                        'filename',
                        path = 1
                    }
                },
                lualine_c = {},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {},
                lualine_z = {'lsp_status'}
            }
        })
    end
}
