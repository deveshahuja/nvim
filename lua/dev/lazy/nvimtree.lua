return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  -- open_on_setup = true, -- Open nvim-tree on startup
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
        -- renderer = {
        --     indent_markers = {
        --         enable = true,
        --     }
        -- }
    }
    
    vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeFocus<cr>")
    vim.keymap.set("n", "<leader>te", "<cmd>:NvimTreeToggle<cr>")

    -- Auto-open on startup if no file
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            if #vim.fn.argv() == 0 then
                require("nvim-tree.api").tree.open()
            end
        end
    })
  end,
}
