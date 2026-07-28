vim.cmd("hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE")
vim.cmd.colorscheme("elflord")
vim.cmd("hi NormalFloat ctermbg=NONE ctermfg=NONE")
vim.cmd("hi FloatBorder ctermbg=NONE ctermfg=NONE")

vim.g.mapleader     = " "
vim.o.undofile      = true
vim.o.laststatus    = 3
vim.o.mouse         = "a"
vim.o.shiftwidth    = 2
vim.o.shiftround    = true
vim.o.tabstop       = 2
vim.o.expandtab     = true
vim.o.autoread      = true
vim.o.smartcase     = true
vim.o.smartindent   = true
vim.o.linebreak     = true
vim.o.scrolloff     = 7
vim.o.backspace     = "indent,eol,start"
vim.o.confirm       = true
vim.o.splitright    = true
vim.o.splitbelow    = true
vim.o.clipboard     = "unnamedplus"
vim.o.title         = true
vim.o.number        = true
vim.o.signcolumn    = "number"
vim.o.swapfile      = false
vim.o.writebackup   = false
vim.o.termguicolors = false
vim.o.completeopt   = "menu,menuone,noinsert,popup"
vim.o.winborder     = "rounded"
vim.opt.fillchars:append({ eob = " " })

local key_opts = { noremap = true, silent = true }
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", key_opts)
vim.keymap.set("n", "<C-t>", ":vs | :term<CR>", key_opts)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, key_opts)
vim.keymap.set("n", "<leader>w", vim.diagnostic.setloclist, key_opts)
vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
      vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, bufopts)
    end
  end,
})

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

require("lazy").setup({
  {
    "lervag/vimtex",
    version = "*", -- master requires nvim 0.12.4+
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = vim.fn.has("mac") == 1 and "skim" or "zathura"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("jsonls", {
        settings = {
          json = {
            validate = { enable = true },
            schemas = {
              { fileMatch = { "package.json" }, url = "https://www.schemastore.org/package.json" },
              { fileMatch = { "tsconfig.json", "tsconfig.*.json" }, url = "https://www.schemastore.org/tsconfig" },
              { fileMatch = { "biome.json", "biome.jsonc" }, url = "https://biomejs.dev/schemas/latest/schema.json" },
            },
          },
        },
      })
      vim.lsp.enable("biome") -- resolved per-project from node_modules, nothing to install
      local servers = {
        vtsls = { "vtsls", "pnpm add -g @vtsls/language-server" },
        jsonls = { "vscode-json-language-server", "pnpm add -g vscode-langservers-extracted" },
        tailwindcss = { "tailwindcss-language-server", "pnpm add -g @tailwindcss/language-server" },
        rust_analyzer = { "rust-analyzer", "rustup component add rust-analyzer" },
        texlab = { "texlab", "cargo install --locked texlab" },
      }
      for name, server in pairs(servers) do
        local bin, install = server[1], server[2]
        if vim.fn.executable(bin) == 1 then
          vim.lsp.enable(name)
        else
          local prompted = false -- "once" is per-pattern, this is per-server
          vim.api.nvim_create_autocmd("FileType", {
            pattern = vim.lsp.config[name].filetypes,
            desc = "lsp-install-prompt:" .. name,
            callback = function()
              if prompted or #vim.api.nvim_list_uis() == 0 then return end -- ask once; never block headless
              prompted = true
              if vim.fn.confirm(("%s is not installed. Run `%s`?"):format(bin, install), "&Yes\n&No") ~= 1 then return end
              vim.notify("Installing " .. bin .. "...")
              vim.system(vim.split(install, " "), {}, vim.schedule_wrap(function(out)
                if out.code == 0 then
                  vim.lsp.enable(name)
                  vim.notify(bin .. " installed")
                else
                  vim.notify(bin .. " install failed:\n" .. (out.stderr or ""), vim.log.levels.ERROR)
                end
              end))
            end,
          })
        end
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({ "typescript", "tsx", "javascript", "rust", "json", "toml", "yaml" })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact", "rust", "json", "jsonc", "toml", "yaml" },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },

  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      picker = { layout = { preset = "ivy" } },
    },
    keys = {
      { "<leader><leader>", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>p", function() Snacks.picker.explorer() end, desc = "Explorer" },
    },
  },

  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    cmd = {
      "ClaudeCode",
    },
    keys = {
      { "<leader>y", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    },
  },
})
