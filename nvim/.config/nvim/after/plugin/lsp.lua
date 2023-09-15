local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
    }
})
