return {
  -- Mason: installs and manages LSP servers
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- Mason-LSPConfig: bridge between Mason and lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls", -- Lua
        "pyright", -- Python
        "ts_ls", -- TypeScript/JavaScript
        "rust_analyzer", -- Rust
        "clangd", -- C/C++
        "jdtls", -- Java
      },
      handlers = {
        ['jdtls'] = function() end, -- Handled by nvim-jdtls
      },
    },
  },

  -- nvim-lspconfig: connects Neovim to LSP servers
  {
    "neovim/nvim-lspconfig",
    dependencies = { 
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local builtin = require("telescope.builtin")

      -- Keybindings on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", builtin.lsp_references, opts)
          vim.keymap.set("n", "gI", builtin.lsp_implementations, opts)
          vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, opts)
          vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, opts)
          vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end,
      })

      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.clangd.setup({})
      -- jdtls handled by nvim-jdtls plugin via FileType autocmd
    end,
  },
}
