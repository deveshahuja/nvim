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

    -- local function add_to_gitignore(node)
    --   local path = node.relative_path or node.name
    --   local gitignore_path = vim.fn.getcwd() .. "/.gitignore"
    --
    --   local lines = {}
    --   if vim.fn.filereadable(gitignore_path) == 1 then
    --     lines = vim.fn.readfile(gitignore_path)
    --   end
    --
    --   for _, line in ipairs(lines) do
    --     if line == path then
    --       vim.notify(path .. " is already in .gitignore", vim.log.levels.INFO)
    --       return
    --     end
    --   end
    --
    --   table.insert(lines, path)
    --   vim.fn.writefile(lines, gitignore_path)
    --   vim.notify("Added to .gitignore: " .. path)
    -- end
    --
    -- vim.keymap.set("n", "<leader>i", function()
    --   local node = require("nvim-tree.api").fs.copy.node()
    --     if node then
    --         add_to_gitignore(node)
    --     end
    -- end, { desc = "Add to .gitignore"} )   
  
  end,
}
