return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      window = {
        position = "left",
        width = 30,
      },
    })
  end
}
