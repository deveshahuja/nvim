return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

        -- just use dd to remove from quick menu
        -- vim.keymap.set("n", "<leader>1", function() harpoon:list():remove_at(1) end)
        -- vim.keymap.set("n", "<leader>2", function() harpoon:list():remove_at(2) end)
        -- vim.keymap.set("n", "<leader>3", function() harpoon:list():remove_at(3) end)
        -- vim.keymap.set("n", "<leader>4", function() harpoon:list():remove_at(4) end)

        vim.keymap.set("n", "<leader>dh", function()
            require("harpoon"):list():clear()
        end, { desc = "Clear Harpoon list" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end)
    end
}
