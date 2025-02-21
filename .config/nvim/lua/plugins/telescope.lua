return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" },  -- 必須ライブラリ
    cmd = "Telescope",  -- `:Telescope` 実行時にロード
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-c>"] = require("telescope.actions").close 
            },
            n = {
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
        defaults = {
          sorting_strategy = "ascending",
        },
      })
    end
  }
}


