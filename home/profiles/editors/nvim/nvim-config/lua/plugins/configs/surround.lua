require('legendary').bind_keymap({'Si', 'S(i_<esc>f)', mode='v'})
require('legendary').bind_autocmds({
    'FileType',
    function ()
        require('legendary').bind_keymap({'Si', [[S"i${ _(<esc>2f"a) }<esc>]], mode='v'})
    end,
    opts = {
        pattern = {'mako'}
    }
})