return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",  -- 遅延ロード（必要になったときに読み込む）
    config = function()
      require("Comment").setup()
    end,
  },
}

