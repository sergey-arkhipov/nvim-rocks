require('telescope').setup({
  defaults = {
    layout_config = {
      -- vertical = { width = 0.5 }
      -- other layout configuration here
      -- other layout configuration here
    }
  },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      -- i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-h>"] = "which_key"
      -- }
    --}
  },
  pickers = {
     find_files = {
      -- theme = "dropdown",
    }
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    --  undo = {
    --   mappings = {
    --     i = {
    --       ["<cr>"] = require("telescope-undo.actions").yank_additions,
    --       ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
    --       ["<C-cr>"] = require("telescope-undo.actions").restore,
    --       -- alternative defaults, for users whose terminals do questionable things with modified <cr>
    --       ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
    --       ["<C-r>"] = require("telescope-undo.actions").restore,
    --     },
    --     n = {
    --       ["y"] = require("telescope-undo.actions").yank_additions,
    --       ["Y"] = require("telescope-undo.actions").yank_deletions,
    --       ["u"] = require("telescope-undo.actions").restore,
    --     },
    --   },
    -- },

    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
})
