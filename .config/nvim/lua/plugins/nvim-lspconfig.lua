return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- `cmp-nvim-lsp` を依存関係に追加
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp") -- `cmp-nvim-lsp` のロード

      local capabilities = cmp_nvim_lsp.default_capabilities({
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true,  -- 🔥 LSP スニペットを有効化
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
        settings = {
          solargraph = {
            diagnostics = true
          }
        }
      })

      -- PHP (intelephense)
      lspconfig.intelephense.setup({
        capabilities = capabilities,
        settings = {
          intelephense = {
            files = {
              maxSize = 5000000, -- ファイルサイズ制限を増やす（Laravel 向け）
            },
          }, },
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
