-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = require("lazyvim.util").safe_keymap_set

-- Normal mode mappings
map("n", "<Leader>x", ":bd<CR>")
map("n", "<Leader>n", ":Neoformat<CR>")
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "-", ":Switch<CR>")
map("n", "<Leader>w", ":w<cr>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<Leader>u", ":UndotreeToggle<CR>")
map("n", "<Leader>f", "<Leader>ff")
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<C-p>", ":wa | !bash upload.sh<CR>")

-- Insert mode mappings
map("i", "jk", "<ESC>")

-- Visual mode mappings
map("v", "ga", ":EasyAlign")

-- Better up/down movements
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
