local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
  },
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { 'package.json' },
          url = 'https://json.schemastore.org/package.json',
        },
      },
    }
  }
})
