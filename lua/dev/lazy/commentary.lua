return {
    "tpope/vim-commentary",
    config = function ()
        -- vim.keymap.set("n", "<C-/>", ":norm gcc<CR>")
        -- vim.keymap.set("i", "<C-/>", ":norm <Esc>gcc<CR>")
        vim.keymap.set("n", "<leader>/", ":norm gcc<CR>")
    end
}
