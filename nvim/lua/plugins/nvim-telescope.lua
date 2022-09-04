require("utils")

local telescope = require("telescope")

lnmap("<leader>", ":lua require('telescope.builtin').git_files({show_untracked=true})<CR>")
lnmap("n", ":lua require('telescope.builtin').git_files({show_untracked=true, cwd='$HOME/vimwiki/'})<CR>")
lnmap("/", ":Telescope live_grep<CR>")
lnmap("b", ":Telescope buffers<CR>")

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")
