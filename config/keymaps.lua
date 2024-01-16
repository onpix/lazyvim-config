-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = require("lazyvim.util").safe_keymap_set

-- Normal mode mappings
map("n", "<Leader>x", ":bd<CR>")
map("n", "<Leader>n", ":Neoformat<CR>")
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
-- vim.api.nvim_set_keymap('n', '<Leader><Leader>', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
map("n", "-", ":Switch<CR>")
map("n", "<Leader>w", ":w<cr>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<Leader>u", "<cmd>UndotreeToggle<CR>")
map("n", "<Leader>f", "<Leader>ff")
map("n", "j", "gj")
map("n", "k", "gk")
-- map("n", "<C-p>", ":wa | !bash upload.sh<CR>")
map("n", "<C-p>", "<cmd>wa | !bash upload.sh<CR>")


-- Insert mode mappings
map("i", "jk", "<ESC>")

-- Visual mode mappings
map("v", "ga", ":EasyAlign")

-- Better up/down movements
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })


-- function RunScriptWithProgressiveOutput()
--   local plugin = "My Script Execution"
--
--   -- Function to handle script output
--   local function on_output(event, data)
--     if data then
--       for _, line in ipairs(data) do
--         if line ~= "" then
--           vim.notify(line, vim.log.levels.INFO, {
--             title = plugin,
--           })
--         end
--       end
--     end
--   end
--
--   -- Start the script and capture its output
--   local job_id = vim.fn.jobstart('bash upload.sh', {
--     on_stdout = on_output,
--     on_stderr = on_output,
--     stdout_buffered = true,
--     stderr_buffered = true
--   })
-- end

-- vim.api.nvim_set_keymap('n', '<C-p>', ':lua RunScriptWithProgressiveOutput()<CR>', { noremap = true, silent = true })
--
