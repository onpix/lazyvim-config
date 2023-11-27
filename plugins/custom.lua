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

  { "tpope/vim-surround" },
  { "mg979/vim-visual-multi" },
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
  {
    "AndrewRadev/switch.vim"
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    opts = {
      open_mapping = [[<c-\>]],
      direction = 'float'
    }
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {
        keywords = {
          HACK = { icon = " ", color = "warning", alt = { "hack" } },
          WARN = { icon = " ", color = "warning", alt = { "warn" } },
          PERF = { icon = "󰄋 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "perf" } },
          NOTE = { icon = "󰎞 ", color = "hint", alt = { "note" } },
          TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "test", "pending" } }
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
  {
    "giusgad/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
    -- config = function()
    --   require("pets").setup({
    --     row = 7,                      -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
    --     col = 0,                      -- the column to display the pet at (set to high number to have it stay still on the right side)
    --     speed_multiplier = 1,         -- you can make your pet move faster/slower. If slower the animation will have lower fps.
    --     default_pet = "dog",          -- the pet to use for the PetNew command
    --     default_style = "brown",      -- the style of the pet to use for the PetNew command
    --     random = true,                -- wether to use a random pet for the PetNew command, ovverides default_pet and default_style
    --     death_animation = true,       -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
    --     popup = {                     -- popup options, try changing these if you see a rectangle around the pets
    --       width = "30%",              -- can be a string with percentage like "45%" or a number of columns like 45
    --       winblend = 100,             -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
    --       hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
    --       avoid_statusline = false,   -- if winblend is 100 then the popup is invisible and covers the statusline, if that
    --       -- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
    --     }
    --   })
    -- end,
  },

  -- use super-tab for completion
  {
    "hrsh7th/nvim-cmp",
    -- dependencies = {
    --   "hrsh7th/cmp-emoji",
    -- },
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
  },
  {
    "rcarriga/nvim-notify",
    -- enabled = false,
    opts = {
      stages = "static",
      render = "wrapped-compact"
    },

  },
  {
    "folke/noice.nvim",
    opts = {

    },
    config = function()
      require("noice").setup {
        messages = {
          -- NOTE: If you enable messages, then the cmdline is enabled automatically.
          -- This is a current Neovim limitation.
          -- enabled = false,             -- enables the Noice messages UI
          view = "notify",             -- default view for messages
          view_error = "notify",       -- view for errors
          view_warn = "notify",        -- view for warnings
          view_history = "messages",   -- view for :messages
          view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        },
      }
    end
  }
}
