require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "typescript", "python", "json", "yaml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
