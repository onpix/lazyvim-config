-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Add your additional options here
opt.relativenumber = true
opt.wrap = true

-- Continue adding other options as per your requirements
vim.g.neoformat_enabled_python = { 'black' }
vim.g.neoformat_enabled_latex = { 'latexindent' }
vim.g.neoformat_enabled_cuda = { 'clangformat' }
vim.g.neoformat_cuda_clangformat = {
  exe = 'clang-format',
  args = { '--style="{BasedOnStyle: google, IndentWidth: 2}"' },
  stdin = 1,
}
