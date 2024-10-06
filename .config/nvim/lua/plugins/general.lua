-- this is a comment
local plugins = {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		lazy = false,
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"jvgrootveld/telescope-zoxide",
	},
	{
		"nmac427/guess-indent.nvim",
		opts = {
			-- can put config here
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = { "catppuccin", "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				always_show_bufferline = false,
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		},
	},
	{
		"famiu/bufdelete.nvim",
		event = "BufNew",
	},
	{
		"numToStr/Comment.nvim",
		event = "User FilePost",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = { theme = "catppuccin-mocha" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			exclude = {
				filetypes = {
					"dashboard",
					"help",
					"terminal",
					"lazy",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
					"mason",
					"nvdash",
					"nvcheatsheet",
					"",
				},
			},
			-- show_trailing_blankline_indent = false,
			-- show_first_indent_level = false,
			-- show_current_context = true,
			-- show_current_context_start = true,
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}

return plugins
