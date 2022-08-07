vim.diagnostic.config({virtual_text = false})

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

  vim.cmd([[
    if exists(":EslintFixAll")
      autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
    endif
  ]])
end

local lsp_flags = {
  debounce_text_changes = 150,
}


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local servers = {"pyright", "tsserver", "rust_analyzer", "eslint"}
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
  }
end

