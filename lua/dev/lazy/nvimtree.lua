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

    local function add_to_gitignore(node)
        local full_path = node.absolute_path or node.name
        local rel_path = vim.fn.fnamemodify(full_path, ":.")
        -- for windows
        path = rel_path:gsub("\\", "/") 
        
        local gitignore_path = vim.fn.getcwd() .. "/.gitignore"

        local lines = {}
        if vim.fn.filereadable(gitignore_path) == 1 then
            lines = vim.fn.readfile(gitignore_path)
        end

        for _, line in ipairs(lines) do
            if line == path then
                vim.notify(path .. " is already in .gitignore", vim.log.levels.INFO)
                return
            end
        end

        table.insert(lines, path)
        vim.fn.writefile(lines, gitignore_path)

        --  Reload .gitignore buffer if it's open
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) then
                local name = vim.api.nvim_buf_get_name(buf)
                if name:match("%.gitignore$") then
                    vim.api.nvim_buf_call(buf, function()
                    vim.cmd("edit!")
                    end)
                    break
                end
            end
        end

            vim.notify("Added to .gitignore: " .. path)
    end

    vim.keymap.set("n", "ig", function()
      local node = require("nvim-tree.api").tree.get_node_under_cursor()
      if node then
        add_to_gitignore(node)
      else
        vim.notify("No node selected", vim.log.levels.WARN)
      end
    end, { desc = "Add to .gitignore" })
  
  end,
}
