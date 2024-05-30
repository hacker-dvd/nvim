return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 10,
      open_mapping = [[<c-\>]],
      -- direction = "float",
      float_opts = {
        border = "curved",
        -- width = 100,
        -- height = 20,
     },
    })
  end
}
