return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				--`:help vim.lsp.*`
				-- 2024.12.14   使用lspsaga 的快捷键
				local opts = { buffer = ev.buf, silent = true }
				--
				-- -- 设置快捷键
				-- opts.desc = "Show LSP references"
				-- keymap.set("n", "gz", "<cmd>Telescope lsp_references<CR>", opts) -- 显示定义和参考文献
				--
				-- opts.desc = "Go to declaration"
				-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- 去声明地
				--
				-- opts.desc = "Show LSP definitions"
				-- --keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- 显示lsp定义
				--
				-- opts.desc = "Show LSP implementations"
				-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- 显示lsp实现
				--
				-- opts.desc = "Show LSP type definitions"
				-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- 显示lsp类型定义
				--
				-- opts.desc = "See available code actions"
				-- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- 查看可用代码操作，在可视模式下将应用于选择
				--
				-- opts.desc = "Smart rename"
				-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- 重命名
				--
				-- opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- 显示文件的诊断结果
				--
				-- opts.desc = "Show line diagnostics"
				-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- 显示本行诊断结果
				--
				-- opts.desc = "Go to previous diagnostic"
				-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- 跳转到缓冲区中之前的诊断
				--
				-- opts.desc = "Go to next diagnostic"
				-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- 在缓冲区中跳转到下一个诊断
				--
				-- opts.desc = "Show documentation for what is under cursor"
				-- -- keymap.set("n", "K", vim.lsp.buf.hover, opts) --  显示文档以查看光标下的内容
				--
				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- 映射以在必要时重新启动lsp
			end,
		})

		-- 用于启用自动完成(指定给每个lsp服务器配置)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󱐋 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				-- -配置lua服务器(附带特殊设置)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- 使语言服务器全局识别“vim
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			-- ["rust_analyzer"] = function()
			-- 	lspconfig["rust_analyzer"].setup({
			-- 		setting = {
			-- 			cargo = {
			-- 				allFeatures = true,
			-- 			},
			-- 		},
			-- 	})
			-- end,
			["gopls"] = function()
				lspconfig["gopls"].setup({
					capabilities = capabilities,
					settings = {
						gopls = {
							analyses = {
								unusedparams = true,
								shadow = true,
							},
							staticcheck = true,
						},
					},
				})
			end,
		})
	end,
}
