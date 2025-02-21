return {
  {
    "kylechui/nvim-surround",
    version = "*",  -- 常に最新バージョンを使用
    event = "VeryLazy",  -- 遅延ロード
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
