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
}
