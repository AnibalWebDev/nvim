return {
	{
		'akinsho/toggleterm.nvim',
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<A-t>]],
				direction = "tab",
				close_on_exit = true,
				shell = vim.o.shell,
			})
		end,
	},
}
