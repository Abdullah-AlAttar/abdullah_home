-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.recipes.vscode" },
    { import = "astrocommunity.pack.lua" },
    -- import/override with your plugins folder
    { import = "astrocommunity.completion.copilot-lua" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.colorscheme.vscode-nvim" },
    { import = "astrocommunity.scrolling.mini-animate" },
    { import = "astrocommunity.pack.go" },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.sql" },
    { import = "astrocommunity.recipes.cache-colorscheme" },
    { import = "astrocommunity.programming-language-support.csv-vim" },
  }
  