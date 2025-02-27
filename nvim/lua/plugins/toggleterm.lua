return {
  "akinsho/toggleterm.nvim",
  config = true,
  cmd = "ToggleTerm",
  build = ":ToggleTerm",
  keys = {
    { "<C-_>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  },
  opts = {
    open_mapping = [[<C-_>]],
    size = 30,
    direction = "vertical",
    shade_filetypes = {},
    hide_numbers = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_mode = true,
    start_in_insert = true,
    close_on_exit = true,
  },
}
