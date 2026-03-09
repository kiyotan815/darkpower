return {
  {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "solargraph",
          "intelephense",
          "html",
          "cssls",
          "jsonls",
        },
      })
      -- setup_handlers は不要（nvim-lspconfig.lua で vim.lsp.config/enable を使用）
    end
  }
}
