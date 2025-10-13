return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require("lspconfig")
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
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- Ruby (Solargraph)
      lspconfig.solargraph.setup({
        capabilities = capabilities,
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby" },
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
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
      lspconfig.intelephense.setup({
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
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- CSS
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      -- JSON
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
    end
  }
}
