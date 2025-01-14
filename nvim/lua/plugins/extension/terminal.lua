return {
  "akinsho/toggleterm.nvim",
  event = "BufReadPre",
  config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
        width = 130,
        height = 30,
      },
    }
  end,
}
