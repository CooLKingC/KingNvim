return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local logo = [[
                                                                           
      ██╗  ██╗███████╗███╗   ██╗ ██████╗ ██╗  ██╗██╗███╗   ██╗ ██████╗   
      ██║  ██║██╔════╝████╗  ██║██╔════╝ ██║ ██╔╝██║████╗  ██║██╔════╝   
      ███████║█████╗  ██╔██╗ ██║██║  ███╗█████╔╝ ██║██╔██╗ ██║██║  ███╗  
      ██╔══██║██╔══╝  ██║╚██╗██║██║   ██║██╔═██╗ ██║██║╚██╗██║██║   ██║  
      ██║  ██║███████╗██║ ╚████║╚██████╔╝██║  ██╗██║██║ ╚████║╚██████╔╝  
      ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝   

    ]]

		require("dashboard").setup({
			theme = "doom",
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{
						action = "Telescope find_files",
						desc = "Find File",
						icon = " ",
						key = "f",
					},
					{
						action = "ene | startinsert",
						desc = " New File",
						icon = " ",
						key = "n",
					},
					{
						action = "Telescope oldfiles",
						desc = " Recent Files",
						icon = " ",
						key = "o",
					},
					{
						action = "Telescope live_grep",
						desc = " Find Keywords",
						icon = " ",
						key = "g",
					},
					{
						action = 'lua require("persistence").load()',
						desc = " Restore Session",
						icon = " ",
						key = "s",
					},
					{
						action = "Lazy",
						desc = " Lazy",
						icon = "󰒲 ",
						key = "l",
					},
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return {
						"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						"",
						"  version v.0.10.2",
					}
				end,
			},
		})
	end,
}
