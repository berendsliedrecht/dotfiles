vim.cmd("hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE")
vim.cmd("colorscheme vim")

vim.g.mapleader   = " "
vim.o.undofile    = true
vim.o.laststatus  = 3
vim.o.mouse       = "a"
vim.o.shiftwidth  = 2
vim.o.shiftround  = true
vim.o.tabstop     = 2
vim.o.expandtab   = true
vim.o.autoread    = true
vim.o.smartcase   = true
vim.o.smartindent = true
vim.o.linebreak   = true
vim.o.scrolloff   = 7
vim.o.backspace   = "indent,eol,start"
vim.o.confirm     = true
vim.o.splitright  = true
vim.o.splitbelow  = true
vim.o.clipboard   = "unnamedplus"
vim.o.title       = true
vim.o.number      = true
vim.o.signcolumn  = "number"
vim.o.swapfile    = false
vim.o.writebackup = false

local key_opts = { noremap = true, silent = true } 
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", key_opts )
vim.keymap.set('n', '<C-t>', ":vs | :term<CR>", key_opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, key_opts)
vim.keymap.set('n', '<leader>w', vim.diagnostic.setloclist, key_opts)

vim.cmd([[autocmd FileType rust nnoremap <buffer> <silent> <leader>[ :silent :!cargo fmt<CR>]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local servers = {
  python = {
    servers = { "pyright" },
    settings = {},
  },
  typescript = {
    servers = { "ts_ls" },
    settings = {},
  },
  rust = {
    settingsKey = "rust-analyzer",
    servers = { "rust_analyzer" },
    settings = {}
  },
  yaml = {
    servers = { "yamlls" },
    settings = {
      keyOrdering = false,
      schemas = {
        {
          fileMatch = { '.github/**/*.yml', '.github/**/*.yaml' },
          url = "https://json.schemastore.org/github-workflow.json",
        }
      }
    }
  },
  json = {
    servers = { "jsonls" },
    settings = {
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
          fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
          url = 'http://json.schemastore.org/lerna'
        },
      }
    }
  }
}

require("lazy").setup({
  { 
    "neovim/nvim-lspconfig", 
    dependencies = {
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function() 
      for k, lsp in pairs(servers) do
        if next(lsp) == nil then break end
        local settings = {}
        if lsp.settingsKey then 
	        settings[lsp.settingsKey] = lsp.settings
        else 
	        settings[k] = servers[k].settings
        end
        for _, server in ipairs(lsp.servers) do
          require("lspconfig")[server].setup({
            capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            on_attach = function(client, bufnr)
              local bufopts = { noremap=true, silent=true, buffer=bufnr }
              vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
              vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
              vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
              vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            end,
            flags = {
              debounce_text_changes = 150 
            },
            handlers = {
              ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
              ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
            },
            settings = settings
          })
        end
      end
    end
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
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
        completion = { autocomplete = false },
        settings = {
          yaml = servers.yaml.settings,
          json = servers.json.settings,
        }
      })
    end,
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local keyset={}
      local n=0
      for k,v in pairs(servers) do
        n = n + 1
        keyset[n] = k
      end
      require("nvim-treesitter.configs").setup({
        ensure_installed = keyset,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      },
    },
    config = function()
      telescope = require("telescope")
      telescope_theme = require('telescope.themes').get_ivy({
        layout_config = {
          height = 17
        }
      })

      project_files = function()
          local _, ret, _ = require("telescope.utils")
            .get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
          if ret == 0 then 
              require('telescope.builtin').git_files(telescope_theme) 
          else 
              require('telescope.builtin').find_files(telescope_theme) 
          end 
      end

      vim.keymap.set("n", "<leader><leader>", ":lua project_files()<CR>", key_opts)
      vim.keymap.set("n", "<leader>p", ":lua require('telescope').extensions.file_browser.file_browser(telescope_theme)<CR>", key_opts)
      vim.keymap.set("n", "<leader>/", ":lua require('telescope.builtin').live_grep(telescope_theme)<CR>", key_opts)
      vim.keymap.set("n", "<leader>b", ":lua require('telescope.builtin').buffers(telescope_theme)<CR>")

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
        },
        pickers = {
          git_files = {
            show_untracked = true
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          file_browser = {
            theme = "ivy",
            previewer = false,
            initial_mode = "normal",
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
    end
  }
}, { install = { colorscheme = { "vim" } }})


