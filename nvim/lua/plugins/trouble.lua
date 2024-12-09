return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<CR>"
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>"
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>"
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>"
        },
        {
            "<leader>xq",
            "<cmd>Trouble qflist toggle<cr>"
        }
    }
}
