require("utils")

local telescope = require("telescope")

lnmap("<leader>", ":Telescope git_files<CR>")
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
telescope.load_extension("projects")
