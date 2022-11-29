vim.g.yankstack_yank_keys = {'y', 'd'}

require('legendary').bind_keymaps({
    {'<c-p>', '<Plug>yankstack_substitute_older_paste'},
    {'<c-n>', '<Plug>yankstack_substitute_newer_paste'},
})