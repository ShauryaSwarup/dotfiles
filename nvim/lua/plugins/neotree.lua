return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    opts = {
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(arg)
            vim.cmd([[
              setlocal relativenumber
            ]])
          end,
        },
      },
      --  show hidden files by default
      filesystem = {
        filtered_items = {
          --visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".github",
            ".gitignore",
            "package-lock.json",
          },
          never_show = { ".git" },
        },
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["s"] = "none",
          ["sl"] = {
            function(state)
              vim.cmd("wincmd l")
            end,
            desc = "Move to Right Window",
          },
          ["Y"] = {
            function(state)
              -- Existing logic to copy path to clipboard
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["O"] = {
            function(state)
              -- Existing logic to open file with system app
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
          },
        },
      },
    },
  },
}
