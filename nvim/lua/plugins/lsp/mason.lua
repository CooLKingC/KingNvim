return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- 安装非语言服务器的其他内容
	},
	config = function()
		-- 导入 mason
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")
		-- 导入mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- 启动mason和configure图标
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- 供mason安装的服务器列表
			ensure_installed = {
				"clangd",
				"lua_ls",
				"pyright",
				"jdtls",
				"gopls",
			},
			-- 自动安装已配置的服务器
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- 标准格式
				"stylua", -- lua
				"isort", -- python
				"black", -- python
				"pylint", -- python
				"google-java-format", -- java
				"checkstyle", -- java
				"cpplint", -- c cpp
				"eslint_d", -- js ts
			},
		})
	end,
}
