return{
  "nvim-treesitter/nvim-treesitter",
  event = {"BufReadPre","BufNewFile"},
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function ()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({ 
      -- 启用语法高亮
      highlight = {
        enable = true
      }, 
      -- 启用缩进
      indent = {
        enable = true
      },
      -- 启用自动标记
      autotag = {
        enable = true
      },
      ensure_installed = {
        "vim",
        "lua",
        "bash",
        "c",
        "vimdoc",
        "cpp",
        "java",
        "javascript",
        "python",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end
}
