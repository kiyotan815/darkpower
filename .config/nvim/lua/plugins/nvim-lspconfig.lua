return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities({
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true,
            },
          },
        },
      })

      -- TypeScript LSP
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
      })

      -- Ruby (Solargraph)
      vim.lsp.config('solargraph', {
        capabilities = capabilities,
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby" },
        root_markers = { "Gemfile", ".git" },
        settings = {
          solargraph = {
            diagnostics = true,
            completion = true,
            hover = true,
            formatting = true,
            symbols = true,
            definitions = true,
            rename = true,
            references = true,
            folding = true,
            highlights = true,
          }
        },
        init_options = {
          formatting = true,
        },
      })

      -- PHP (intelephense)
      vim.lsp.config('intelephense', {
        capabilities = capabilities,
        settings = {
          intelephense = {
            files = {
              maxSize = 5000000,
            },
          },
        },
      })

      -- HTML
      vim.lsp.config('html', {
        capabilities = capabilities,
      })

      -- CSS
      vim.lsp.config('cssls', {
        capabilities = capabilities,
      })

      -- JSON
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
      })

      -- 全て有効化
      vim.lsp.enable({ 'ts_ls', 'solargraph', 'intelephense', 'html', 'cssls', 'jsonls' })
    end
  }
}
