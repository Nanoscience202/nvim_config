return {
    'ThePrimeagen/harpoon',
    opts = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { 'harpoon' },

        -- set marks specific to each git branch inside git repository
        mark_branch = false,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = '   ',
        tabline_suffix = '   ',
    },
    config = function(_, opts)
        require('harpoon').setup(opts)
        require('telescope').load_extension 'harpoon'

        local map = require('util').map

        map('n', '<leader>ht', require('harpoon.mark').toggle_file, { desc = '[H]arpoon [T]oogle' })
        map('n', '<leader>hc', require('harpoon.mark').clear_all, { desc = '[H]arpoon [C]lear all' })
        map('n', '<leader>fh', ':Telescope harpoon marks <CR>', { desc = '[F]ind [H]arpoon' })
        map('n', '<leader>hl', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon [L]ist' })
        map('n', '[h', require('harpoon.ui').nav_prev, { desc = 'previous harpoon' })
        map('n', ']h', require('harpoon.ui').nav_next, { desc = 'next harpoon' })
        map('n', '<leader>h', function()
            local char = vim.fn.getchar() - 48
            require('harpoon.ui').nav_file(char)
        end, { desc = '[H]arpoon [N]av' })
    end,
}
