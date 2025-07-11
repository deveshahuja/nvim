return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ap', builtin.find_files, { desc = 'Telescope find all files' })
        vim.keymap.set('n', '<Leader>p', builtin.git_files, { desc = 'Telescope find git files' })
        vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope live grep' })
        --vim.keymap.set('n', '<leader>pws', function()
        --    local word = vim.fn.expand("<cword>")
        --    builtin.grep_string({ search = word })
        --end)
        --vim.keymap.set('n', '<leader>pWs', function()
        --    local word = vim.fn.expand("<cWORD>")
        --    builtin.grep_string({ search = word })
        --end)
        --vim.keymap.set('n', '<leader>ps', function()
        --    builtin.grep_string({ search = vim.fn.input("Grep > ") })
        --end)
        --vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}


