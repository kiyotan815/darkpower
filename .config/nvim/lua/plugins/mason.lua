return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",    -- TypeScript / JavaScript
          "solargraph",  -- Ruby (Rails)
          "intelephense", -- PHP (Laravel)
          "html",        -- HTML
          "cssls",       -- CSS
          "jsonls",      -- JSON
        },
      })
    end
  }
}
