return {
  "hinell/lsp-timeout.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  init = function()
    vim.g.lspTimeoutConfig = {
      stopTimeout = 999 * 60 * 25, -- ms, timeout before stopping all LSPs
      startTimeout = 999 * 1, -- ms, timeout before restart
      silent = false, -- true to suppress notifications
    }
    -- Optionally, validate the config
    local Config = require("lsp-timeout.config").Config
    Config:new(vim.g.lspTimeoutConfig):validate()
  end,
}
