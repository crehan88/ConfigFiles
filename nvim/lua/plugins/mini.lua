return {
    "echasnovski/mini.nvim",
    version = "*",
    config = function ()
        local starter = require('mini.starter')
        require('mini.ai').setup()
        require('mini.git').setup()
        require('mini.diff').setup()
        -- require('mini.notify').setup()
        require('mini.pairs').setup()
        require('mini.cursorword').setup()
        -- require('mini.map').setup()
        require('mini.surround').setup()
        require('mini.misc').setup()
        require('mini.bracketed').setup()
        -- require('mini.animate').setup()
        require('mini.jump2d').setup()
        require('mini.colors').setup()
        require('mini.starter').setup({
            evaluate_single = true,
            items = {
                starter.sections.builtin_actions(),
                starter.sections.recent_files(10,false),
                starter.sections.recent_files(10,true),
                starter.sections.sessions(5,true),
                { name =  'TheLeague', action = 'edit ~/ProjectRepos' , section = 'Projects'}
            },
            content_hooks = {
                starter.gen_hook.adding_bullet(),
                starter.gen_hook.aligning('center','center')
            }
        })
        require('mini.sessions').setup()
        require('mini.files').setup()
        require('mini.bufremove').setup()
        require('mini.jump').setup()
        require('mini.indentscope').setup()
        -- require('mini.doc').setup()
        require('mini.statusline').setup()
        require('mini.icons').setup()
        require('mini.tabline').setup()
        -- require('mini.visits').setup()
        -- require('mini.pick').setup()
        -- require('mini.extra').setup()

    end
}
