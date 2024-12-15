return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						-- 上下移动选择文件
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						-- 关闭窗口
						["<leader>f"] = "close",
						-- 预览窗口上下移动
						["<C-u>"] = "preview_scrolling_up",
						["<C-d>"] = "preview_scrolling_down",
					},
				},
			},
		})

		telescope.load_extension("fzf")
		local keymap = vim.keymap

		-- 在当前查找文件
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		-- 在当前工作目录中查找最近打开的文件
		keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		-- 在当前工作目录中查找字符串
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy string in cwd" })
	end,
}
