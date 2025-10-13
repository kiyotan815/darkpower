return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- ← 依存として追加
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },

    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("laravel").setup()
    end,
  },
}
