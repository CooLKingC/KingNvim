return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
██╗  ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
██║ ██╔╝██║████╗  ██║██╔════╝ ██║   ██║██║████╗ ████║
█████╔╝ ██║██╔██╗ ██║██║  ███╗██║   ██║██║██╔████╔██║
██╔═██╗ ██║██║╚██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██╗██║██║ ╚████║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

    -- logo = string.rep("\n", 4) .. logo .. "\n"
    logo = string.rep("\n", 4) .. logo .. ""

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                           desc = "Find File",        icon = " ",  key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ",  key = "n" },
					{ action = "Telescope oldfiles",                             desc = " Recent Files",    icon = " ",  key = "o" },
					{ action = "Telescope live_grep",                            desc = " Find Keywords",   icon = " ",	key = "g" },
					{ action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ",  key = "s" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ",  key = "L" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ",  key = "q" },
        },

        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 46 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
