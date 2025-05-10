return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local bufnr = ev.buf
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
          end

          map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
          map('n', 'gd', vim.lsp.buf.definition, 'Go to Definition')
          map('n', 'gD', vim.lsp.buf.declaration, 'Go to Declaration')
          map('n', 'gi', vim.lsp.buf.implementation, 'Go to Implementation')
          map('n', 'gt', vim.lsp.buf.type_definition, 'Go to Type Definition')
          map('n', 'gr', vim.lsp.buf.references, 'Show References')
          map('n', '<leader>lrn', vim.lsp.buf.rename, 'LSP Rename')
          map({'n', 'v'}, '<leader>lca', vim.lsp.buf.code_action, 'LSP Code Action')

          map('n', '[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
          map('n', ']d', vim.diagnostic.goto_next, 'Next Diagnostic')
          map('n', '<leader>le', vim.diagnostic.open_float, 'Show Line Diagnostics')
          map('n', '<leader>lq', vim.diagnostic.setloclist, 'Open Diagnostics List')

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.server_capabilities.documentFormattingProvider then
            map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true, bufnr = bufnr }) end, "Format Document")
          end
          if client and client.server_capabilities.documentRangeFormattingProvider then
             map("x", "<leader>lf", function() vim.lsp.buf.format({ async = true, bufnr = bufnr }) end, "Format Selection")
          end

          print(string.format("LSP attached: %s (ID: %d) to buffer %d", client.name, client.id, bufnr))
        end,
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "eslint",
        "jsonls",
        "marksman",
        "bashls",
        "dockerls",
        "yamlls",
        "html",
        "cssls",
        "pyright",
        "gopls",
        "rust_analyzer",
      },
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
}
