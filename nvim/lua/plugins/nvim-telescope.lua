require("utils")

local telescope = require("telescope")

local utils = require('telescope.utils')
local builtin = require('telescope.builtin')
telescope_theme = require('telescope.themes').get_ivy({
  layout_config = {
    height = 17
  }
})

project_files = function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
    if ret == 0 then 
        builtin.git_files(telescope_theme) 
    else 
        builtin.find_files(telescope_theme) 
    end 
end

lnmap("<leader>", ":lua project_files()<CR>")
lnmap("p", ":lua require('telescope').extensions.file_browser.file_browser(telescope_theme)<CR>")
lnmap("/", ":lua require('telescope.builtin').live_grep(telescope_theme)<CR>")
lnmap("b", ":lua require('telescope.builtin').buffers(telescope_theme)<CR>")

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
      hijack_netrw = true,
      initial_mode = "normal",
    },
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
