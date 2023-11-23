-- This file contains plugin configurations for LazyVim
-- Plugins will be automatically loaded by lazy.nvim

return {
  -- Example plugins and configurations:

  -- Treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "bash", "c", "javascript", "vue", "json", "lua", "python", "typescript", "css", "yaml"
        },
        ignore_install = { "haskell" },
        highlight = { enable = true }
      }
    end
  },

  -- Vim surround plugin
  { "tpope/vim-surround" },

  -- Visual multi plugin
  { "mg979/vim-visual-multi" },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true, script = true })
    end
  },

  -- Leap motion plugin
  -- {
  --   "ggandor/leap.nvim",
  --   config = function()
  --     require('leap').add_default_mappings()
  --   end
  -- },

  -- TypeScript auto tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  -- Switch.vim for quick switching
  {
    "AndrewRadev/switch.vim"
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {
        keywords = {
          FIX = { icon = " ", color = "error", alt = { "fix", "fixme", "fixit", "issue" } },
          TODO = { icon = " ", color = "info", alt = { "todo" } },
          HACK = { icon = " ", color = "warning", alt = { "hack" } },
          WARN = { icon = " ", color = "warning", alt = { "warn" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "perf" } },
          NOTE = { icon = " ", color = "hint", alt = { "note" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "test", "pending" } }
        }
      }
    end
  },

  -- Neoformat plugin
  { "sbdchd/neoformat" },

  -- Vim easy align
  { "junegunn/vim-easy-align" },

  -- Undo tree plugin
  { "mbbill/undotree" },

  -- Add any additional plugins and configurations as needed
  -- Color scheme
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim" },
  {
    "giusgad/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
  },
  { "akinsho/toggleterm.nvim" },

  -- use super-tab for completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  }
}
