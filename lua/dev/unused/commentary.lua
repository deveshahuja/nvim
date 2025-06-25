return {
    "tpope/vim-commentary",
    config = function ()
        -- might work in linux
        -- vim.keymap.set("n", "<C-/>", ":norm gcc<CR>")
        -- vim.keymap.set("i", "<C-/>", ":norm <Esc>gcc<CR>")
        -- vim.keymap.set("n", "<leader>/", ":norm gcc<CR>")
        -- vim.keymap.set("n", "<leader>/ap", ":norm gcap<CR>")
        -- vim.keymap.set("n", "<leader>/", "gcc")
        -- vim.keymap.set("n", "<leader>/", "gcc", { noremap = false, desc = "Toggle comment (line)" })
        vim.keymap.set("n", "<leader>/", function()
            vim.cmd.normal("gcc")
        end, { desc = "Toggle comment line" })      

        -- vim.keymap.set("n", "<leader>/", function()
        --   vim.api.nvim_feedkeys("gcc", "n", false)
        -- end)

        vim.keymap.set("v", "<leader>/", function()
          vim.api.nvim_feedkeys("gc", "x", false)
        end)
        -- vim.keymap.set("v", "<leader>/", "gc", { noremap = false, desc = "Toggle comment (selection)" })
        vim.keymap.set("n", "<leader>/ap", ":norm gcap<CR>")
    end
}
