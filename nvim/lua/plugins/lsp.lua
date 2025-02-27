return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "clangd",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "gopls",
      })
    end,
  },
  -- -- lsp servers
  -- {
  --   "neovim/nvim-lspconfig",
  --   -- Add this global on_attach function
  --   on_attach = function(client, bufnr)
  --     -- Improved attachment strategy
  --     client.attached_buffers = client.attached_buffers or {}
  --     if not client.attached_buffers[bufnr] then
  --       client.attached_buffers[bufnr] = true
  --       vim.lsp.buf_attach_client(bufnr, client.id)
  --     end
  --
  --     -- Special handling for full-buffer replacement
  --     vim.api.nvim_create_autocmd("TextChanged", {
  --       buffer = bufnr,
  --       callback = function()
  --         if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
  --           vim.schedule(function()
  --             vim.lsp.buf_detach_client(bufnr, client.id)
  --             vim.lsp.buf_attach_client(bufnr, client.id)
  --           end)
  --         end
  --       end,
  --     })
  --   end,
  --   opts = {
  --     inlay_hints = { enabled = true },
  --     ---@type lspconfig.options
  --     servers = {
  --       cssls = {},
  --       tailwindcss = {
  --         root_dir = function(...)
  --           return require("lspconfig.util").root_pattern(".git")(...)
  --         end,
  --       },
  --       tsserver = {
  --         root_dir = function(...)
  --           return require("lspconfig.util").root_pattern(".git")(...)
  --         end,
  --         single_file_support = false,
  --         settings = {
  --           typescript = {
  --             inlayHints = {
  --               includeInlayParameterNameHints = "literal",
  --               includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --               includeInlayFunctionParameterTypeHints = true,
  --               includeInlayVariableTypeHints = false,
  --               includeInlayPropertyDeclarationTypeHints = true,
  --               includeInlayFunctionLikeReturnTypeHints = true,
  --               includeInlayEnumMemberValueHints = true,
  --             },
  --           },
  --           javascript = {
  --             inlayHints = {
  --               includeInlayParameterNameHints = "all",
  --               includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --               includeInlayFunctionParameterTypeHints = true,
  --               includeInlayVariableTypeHints = true,
  --               includeInlayPropertyDeclarationTypeHints = true,
  --               includeInlayFunctionLikeReturnTypeHints = true,
  --               includeInlayEnumMemberValueHints = true,
  --             },
  --           },
  --         },
  --       },
  --       gopls = {
  --         settings = {
  --           gofumpt = true,
  --           usePlaceholders = true,
  --           staticcheck = true,
  --           analyses = {
  --             unusedparams = true,
  --           },
  --           completeUnimported = true, -- This enables auto-import suggestions
  --           deepCompletion = true,
  --         },
  --       },
  --       html = {},
  --       lua_ls = {
  --         single_file_support = true,
  --         settings = {
  --           Lua = {
  --             workspace = {
  --               checkThirdParty = false,
  --             },
  --             completion = {
  --               workspaceWord = true,
  --               callSnippet = "Both",
  --             },
  --             misc = {
  --               parameters = {
  --                 -- "--log-level=trace",
  --               },
  --             },
  --             hint = {
  --               enable = true,
  --               setType = false,
  --               paramType = true,
  --               paramName = "Disable",
  --               semicolon = "Disable",
  --               arrayIndex = "Disable",
  --             },
  --             doc = {
  --               privateName = { "^_" },
  --             },
  --             type = {
  --               castNumberToInteger = true,
  --             },
  --             diagnostics = {
  --               disable = { "incomplete-signature-doc", "trailing-space" },
  --               groupSeverity = {
  --                 strong = "Warning",
  --                 strict = "Warning",
  --               },
  --               groupFileStatus = {
  --                 ["ambiguity"] = "Opened",
  --                 ["await"] = "Opened",
  --                 ["codestyle"] = "None",
  --                 ["duplicate"] = "Opened",
  --                 ["global"] = "Opened",
  --                 ["luadoc"] = "Opened",
  --                 ["redefined"] = "Opened",
  --                 ["strict"] = "Opened",
  --                 ["strong"] = "Opened",
  --                 ["type-check"] = "Opened",
  --                 ["unbalanced"] = "Opened",
  --                 ["unused"] = "Opened",
  --               },
  --               unusedLocalExclude = { "_*" },
  --             },
  --             format = {
  --               enable = false,
  --               defaultConfig = {
  --                 indent_style = "space",
  --                 indent_size = "2",
  --                 continuation_indent_size = "2",
  --               },
  --             },
  --           },
  --         },
  --       },
  --       clangd = {
  --         cmd = {
  --           "clangd",
  --           "--compile-commands-dir=build",
  --           "--background-index",
  --           "--all-scopes-completion", -- Include results from all scopes
  --           "--completion-style=detailed", -- Better handling of unsaved files
  --           "--offset-encoding=utf-16", -- Important for Neovim's UTF-8 buffers
  --         },
  --         capabilities = {
  --           textDocument = {
  --             synchronization = {
  --               dynamicRegistration = false, -- Disable incremental sync
  --             },
  --           },
  --         },
  --         root_dir = function(fname)
  --           return require("lspconfig.util").root_pattern("compile_commands.json", ".git")(fname)
  --         end,
  --         flags = {
  --           debounce_text_changes = 150,
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji", "saadparwaiz1/cmp_luasnip" },
    opts = function(_, opts)
      opts.snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      }
      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, { name = "luasnip" })
    end,
  },
}
