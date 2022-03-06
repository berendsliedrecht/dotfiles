require("buftabline").setup({
	icon_colors = false,
	tab_format = " #{i} #{b}#{f} ",
	flags = {
		modified = " *",
		not_modifiable = " !",
		readonly = " &",
	},
})
