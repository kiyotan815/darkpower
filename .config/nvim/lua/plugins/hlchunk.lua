return {
  {
    "shellRaining/hlchunk.nvim",
    event = "VeryLazy",  -- 🔥 Neovim 起動時に適用
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,  -- ✅ チャンクハイライトを有効化
          use_treesitter = true,  -- ✅ Treesitter を利用
          notify = false,  -- ✅ エラー通知を無効化
          chars = {
              horizontal_line = "─",
              vertical_line = "│",
              left_top = "┌",
              left_bottom = "└",
              right_arrow = "─",
          },
          style = "#00ffff",
        },
        indent = {
          enable = true,  -- インデントガイドを有効化
          chars = { "│" },  -- インデントに使用する文字
        },
        line_num = {
          enable = true,  -- 行番号ハイライトを無効化（不要なら false）
        },
        blank = {
          enable = false,  -- 空行のハイライト（必要なら true）
        },
      })
    end
  },
}
