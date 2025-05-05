return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<LocalLeader>e"] = { "$", desc = "Go to end of line" }, -- new key binding
          ["<LocalLeader>s"] = { "^", desc = "Go to start of the line" }, -- new key binding

          ["<C-t>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" },
          -- toggle comment
          -- ["<C-/"] = { 'gcc', desc = "Toggle comment" },
          -- ["<C-/"] = { 'gc', desc = "Toggle comment" },

        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          ["<C-space>"] = { "<C-\\><C-n>", desc = "Exit terminal mode" }, -- new key binding to exit terminal mode
          -- toggle terminal
          ["<C-t>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" },

        },
        i = {
          ["<C-t>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" },
        },
      },
    },
  },
}