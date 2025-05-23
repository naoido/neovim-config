vim.loader.enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
vim.opt.number = true
vim.opt.relativenumber = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

require("lazy").setup({
  spec = {
    { { import = "plugins" } }
  },
})

require("keymap")
