return{
  'akinsho/bufferline.nvim',
  version = "*", 
  dependencies = {'nvim-tree/nvim-web-devicons','moll/vim-bbye'},
  config = function()
    require("bufferline").setup({
      options = {
        -- 悬停事件
        hover = {
          enabled = true ,
          delay = 200 ,
          reveal = {'close'}
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          }
        }
      }
    })
  end
}
