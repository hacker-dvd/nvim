return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
}
