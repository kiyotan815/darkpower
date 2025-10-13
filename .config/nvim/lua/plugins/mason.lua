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

      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          -- solargraphは個別に設定済みのため除外
          if server_name ~= "solargraph" then
            lspconfig[server_name].setup({})
          end
        end,
      })
    end
  }
}
