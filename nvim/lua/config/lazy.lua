local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "blue",
        news = {
          lazyvim = true,
          neovim = true,
        },
      },
    },
    -- { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier", lazy = true },
    { import = "lazyvim.plugins.extras.lang.typescript", lazy = true },
    { import = "lazyvim.plugins.extras.lang.json", lazy = true },
    { import = "lazyvim.plugins.extras.lang.tailwind", lazy = true },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns", lazy = true },
    { import = "plugins" },
    -- { import = "lazyvim.plugins.extras.coding.copilot" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  dev = {
    path = "~/.ghq/github.com",
  },
  checker = { enabled = false },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
})
