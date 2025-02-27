-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree show")
  end,
})
vim.api.nvim_create_autocmd("TextChanged", {
  pattern = "*.c,*.cpp,*.h,*.hpp", -- Only for C/C++ files
  callback = function()
    if vim.bo.modifiable and vim.bo.buftype == "" then
      vim.cmd("silent! write")
      vim.cmd("silent! edit")
    end
  end,
})
