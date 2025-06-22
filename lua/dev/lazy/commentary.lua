return {
    "tpope/vim-commentary",
    config = function ()
        -- might work in linux
        -- vim.keymap.set("n", "<C-/>", ":norm gcc<CR>")
        -- vim.keymap.set("i", "<C-/>", ":norm <Esc>gcc<CR>")
        vim.keymap.set("n", "<leader>/", ":norm gcc<CR>")
        vim.keymap.set("n", "<leader>/ap", ":norm gcap<CR>")
    end
}
