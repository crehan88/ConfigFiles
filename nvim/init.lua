require("options")
require("keymaps")
require("lazyinit")

vim.g.nvcode_termcolors = 256
vim.cmd('Colorscheme nvcode')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre", "BufEnter" }, {
    pattern = "*",
    callback = function()
        local filepath = vim.fn.expand('%:p')
        if not filepath:find('minigit') and not vim.bo.filetype:match('git') and not vim.bo.filetype:match('diff') then
            vim.cmd('lcd %:p:h')
        end
    end
})

autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = [[%s/\s\+$//e]]
})

function OpenDefintionInNewBuf()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocuments/definition', params, function(err, result, ctx, _)
        if err or not result or vim.tbl_isempty(result) then
            print("Definition not found")
            return
        end

        if vim.tbl_islist(result) then
            result = result[1]
        end

        local uri = result.uri or result.targetUri
        local range = result.range or result.targetRange
        local bufnr = vim.uri_to_bufnr(uri)

        vim.cmd('vsplit')

        vim.api.nvim_set_current_buf(bufnr)
        vim.api.nvim_win_set_cursor(0, { range.start.line + 1, range.start.character })
    end)
end

autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", OpenDefintionInNewBuf, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostics.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
