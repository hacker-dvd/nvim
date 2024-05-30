vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'

-- 插件管理
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",

    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  }
})

require 'keymaps'
require 'fix'

-- 配色方案
vim.cmd.colorscheme "catppuccin"
