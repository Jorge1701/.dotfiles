local lsp = require('lsp-zero').preset({})

local function allow_format(servers)
    return function(client) return vim.tbl_contains(servers, client.name) end
end

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }

    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({
            async = false,
            timeout_ms = 10000,
            filter = allow_format({ 'gopls', 'lua_ls' })
        })
    end, opts)
end)

lsp.setup()

local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }
})
