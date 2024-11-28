return {
    {
        'Mofiqul/vscode.nvim',
        name = "vs-code",
        config = function ()
            local c = require('vscode.colors').get_colors()
            require('vscode').setup({
                transparent = true,
                italic_comments = true,
                underline_links = true,
                disable_nvimtree_bg = true,
                color_overrides = {
                    vscLineNumber = '#FFFFFF',
                },
                group_overrides = {
                    Cursor = {
                        fg = c.vscDarkBlue,
                        bg = c.vscLightGreen,
                        bold = true
                    }
                }
            })

        end
    }
}