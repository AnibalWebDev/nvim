return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
	require('telescope').setup {
		dependencies = { 'nvim-lua/plenary.nvim' },

		defaults = {
			-- Default configuration for telescope goes here:
			-- config_key = value,

			border           = false,
			sorting_strategy = "descending",
			layout_strategy  = 'bottom_pane',
			layout_config    = {
				bottom_pane = {
					height = 15,
					preview_cutoff = 120,
					prompt_position = "bottom"
				},
			},
			preview          = false,
			prompt_prefix    = "❱❱		",
			selection_caret  = "❱❱❱❱❱		",
			entry_prefix     = "❰❰		"
		},
		pickers = {
			-- Default configuration for builtin pickers goes here:
			-- picker_name = {
			--   picker_config_key = value,
			--   ...
			-- }
			-- Now the picker_config_key will be applied every time you call this
			-- builtin picker
		},
		extensions = {
			-- Your extension configuration goes here:
			lazygit = {
				args = { '--no-reflog' },
			}
			-- please take a look at the readme of the extension you want to configure
		}
	}
}
