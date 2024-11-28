local function find_session_vim_file()
    local cwd = vim.fn.getcwd()
    local sessionname = vim.fn.system("tmux display-message -p @ '#S'"):gsub("\n", "")
    local path_sep = package.config:sub(1, 1)
    local function file_exists(file)
        local f = io.open(file, "r")
        if f then f:close() end
        return f ~= nil
    end

    local function join_paths(...)
        return table.concat({ ... }, path_sep)
    end

    local function search_upwards(dir)
        while dir ~= os.getenv("HOME") do
            local vim_file = join_paths(dir, sessionname .. ".vim")
            if file_exists(vim_file) then
                return vim_file
            end
            dir = dir:match("(.*)" .. path_sep)
        end
        return nil
    end

    return search_upwards(cwd)
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ol', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>ml', builtin.marks, {})
        vim.keymap.set('n', '<leader>fw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>fW', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fS', function()
            local vim_file = find_session_vim_file()
            if vim_file then
                print(":source " .. vim_file)
            else
                print("No session file found")
            end
        end)
    end
}
