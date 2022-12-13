require("utils")

vim.g.do_filetype_lua = true
vim.g.mapleader = " "
vim.cmd("colorscheme koehler")

local function status_line()
  local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
  local right_align = "%="
  local line_no = "%10([%l/%L%)]%"
  local pct_thru_file = "%5p%%"

  return string.format(
    "%s%s%s%s",
    "%=",
    "[%{%v:lua.string.upper(v:lua.vim.fn.mode())%}]",
    " ",
    "[%l]"
  )
end

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
opt("showmode", false)
opt("showcmd", false)
opt("ruler", false)
opt("laststatus", 3)
opt("statusline", status_line())
opt("mouse", "a")
opt("autoindent", true)
opt("expandtab", true)
opt("shiftround", true)
opt("shiftwidth", 2)
opt("smarttab", true)
opt("tabstop", 2)
opt("autoread", true)
opt("hlsearch", true)
opt("incsearch", true)
opt("ignorecase", true)
opt("smartcase", true)
opt("lazyredraw", true)
opt("tabpagemax", 10)
opt("linebreak", true)
opt("scrolloff", 7)
opt("wildmenu", true)
opt("number", true)
opt("errorbells", false)
opt("title", true)
opt("backspace", "indent,eol,start")
opt("confirm", true)
opt("history", 100)
opt("splitbelow", true)
opt("splitright", true)
opt("showmatch", true)
opt("clipboard", "unnamed")
opt("hidden", true)
opt("signcolumn", "number")
opt("swapfile", false)
opt("backup", false)
opt("writebackup", false)
opt("cmdheight", 1)

aopt("fillchars", "vert: ,eob: ,horiz: ,horizup: ,horizdown: ,vertleft: ,vertright: ,verthoriz: ")
aopt("shm", "FWIAqsc")
