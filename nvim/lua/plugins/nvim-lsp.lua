vim.diagnostic.config({virtual_text = false})

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

end

local lsp_flags = {
  debounce_text_changes = 150,
}


local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true


local servers = {"pyright", "tsserver", "rust_analyzer", "eslint", "yamlls", "jsonls", "kotlin_language_server"}
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
        }
      },
      json = {
        schemas = {
          {
            fileMatch = { 'package.json' },
            url = 'https://json.schemastore.org/package.json',
          },
          {
            fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
            url = 'http://json.schemastore.org/tsconfig'
          },
          {
            fileMatch = {'.eslintrc.json', '.eslintrc'},
            url = 'http://json.schemastore.org/eslintrc'
          },
          {
            fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
            url = 'http://json.schemastore.org/prettierrc'
          },
          {
            fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
            url = 'http://json.schemastore.org/lerna'
          },
        }
      }
    }
  }
end
