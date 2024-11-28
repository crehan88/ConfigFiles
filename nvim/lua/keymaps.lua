vim.g.mapleader = " "
vim.g.nerw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 0

vim.keymap.set('n','<C-h>','<C-w><C-h>')
vim.keymap.set('n','<C-l>','<C-w><C-l>')
vim.keymap.set('n','<C-j>','<C-w><C-j>')
vim.keymap.set('n','<C-k>','<C-w><C-k>')

vim.keymap.set('n','H','<cmd>tabprevious <CR>')
vim.keymap.set('n','L','<cmd>tabnext <CR>')
vim.keymap.set('n','<leader>to','<cmd>tabonly <CR>')
vim.keymap.set('n','<leader>nc','<cmd>tabnew ~/.config/nvim <CR>')
vim.keymap.set('n','<leader>et','<cmd>tabnew . <CR>')

vim.keymap.set('n','<leader>wo','<cmd>only <CR>')
vim.keymap.set('n','<leader>ee','<cmd>edit . <CR>')

vim.keymap.set('t','<Esc><Esc>','<C-\\><C-n>')

vim.keymap.set('v',"J",":m '>+1<CR>gv=gv")
vim.keymap.set('v',"K",":m '<-2<CR>gv=gv")

vim.keymap.set('n',"J","mzJ`z")

vim.keymap.set('n','<C-d>','<C-d>zz')
vim.keymap.set('n','<C-u>','<C-u>zz')

vim.keymap.set('n','n','nzzzv')
vim.keymap.set('n','N','Nzzzv')

vim.keymap.set('x','<leader>p',[["_dP]])
vim.keymap.set({'n','v'},'<leader>y',[["+y]])
vim.keymap.set('n','<leader>Y',[["+Y]])
vim.keymap.set({'n','v'},'<leader>d',[["_d]])

vim.keymap.set('n','<leader>f',vim.lsp.buf.format)

vim.keymap.set('n','<leader>k','<cmd>cnext<CR>zz')
vim.keymap.set('n','<leader>j','<cmd>cprev<CR>zz')

vim.keymap.set('n','<leader>s',[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n','<leader>ms', function ()
    local sessionname = vim.fn.system("tmux display-message -p '#S'"):gsub("\n","")
    local sessionpath = _G.nvim_cwd
    vim.cmd(":mks! " .. sessionpath .. '/' .. sessionname .. '.vim')
end
)

vim.keymap.set('n','<leader>ls','<cmd>source % <CR>')

vim.keymap.set('n','<leader>vi',':source ~/.config/nvim/init.lua <CR>')

vim.keymap.set('n','<leader>hd',':Gitsigns diffthis<CR>')
vim.keymap.set('n','<leader>hs',':Gitsigns stage_hunk<CR>')
vim.keymap.set('n','<leader>hr',':Gitsigns reset_hunk<CR>')
vim.keymap.set('n','<leader>hS',':Gitsigns stage_buffer<CR>')
vim.keymap.set('n','<leader>hR',':Gitsigns reset_buffer<CR>')

--vim.keymap.set({ 'n','i','v'}, '<C-c>p','<cmd>Copilot panel <CR>')
--vim.keymap.set({'n','i','v'}, '<C-c>c', function ()
    --local input = vim.fn.input("Quick Chat: ")
    --if input ~= "" then
        --require("CopilotChat").ask(input, {selection = require("CopilotChat.select").buffer })
    --end
--end)
--vim.keymap.set('n','<C-c>o',':CopilotChat <CR>')






