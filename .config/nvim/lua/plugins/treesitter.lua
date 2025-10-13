return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",  -- 🔥 Neovim 起動時に適用
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "php", "lua", "javascript", "json", "html", "ruby", "typescript", "tsx", "yaml", "nginx"
        },
        highlight = { enable = true },  -- シンタックスハイライトを有効化
        indent = { enable = true },  -- 自動インデント
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },
}
