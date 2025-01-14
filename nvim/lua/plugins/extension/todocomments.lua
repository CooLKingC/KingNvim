return {
  "folke/todo-comments.nvim",
  event = "BufReadPre",

  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- refer to the configuration section below
  },

  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
  end, { desc = "Next todo comment" }),
  vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
  end, { desc = "Previous todo comment" }),
  vim.keymap.set("n", "<leader>lt", "<cmd>TodoTelescope<cr>", { desc = "Next error/warning todo comment" }),
}
