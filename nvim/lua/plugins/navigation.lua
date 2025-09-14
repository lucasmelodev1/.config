return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-tree/nvim-web-devicons' },
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			{
				'prochri/telescope-all-recent.nvim',
				dependencies = {
					"kkharji/sqlite.lua",
					-- optional, if using telescope for vim.ui.select
					"stevearc/dressing.nvim"
				},
			},
		},
	},
	{
		'stevearc/oil.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
    { 'mbbill/undotree' },
    { 'christoomey/vim-tmux-navigator', lazy = false, }
}
