return {
  "nvim-treesitter/nvim-treesitter",
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- 初始化选择
          node_incremental = "gnn", -- 增量选择节点
          scope_incremental = "grc", -- 增量选择范围
          node_decremental = "grm", -- 减量选择节点
        },
      },
    }
  end
}
