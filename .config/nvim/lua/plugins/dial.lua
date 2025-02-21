return {
  {
    "monaqa/dial.nvim",
    event = "VeryLazy",  -- 遅延ロード
    config = function()
      local dial = require("dial.map")
      vim.keymap.set("n", "<C-a>", dial.inc_normal(), { noremap = true })  -- `C-a` で増加
      vim.keymap.set("n", "<C-x>", dial.dec_normal(), { noremap = true })  -- `C-x` で減少
      vim.keymap.set("v", "<C-a>", dial.inc_visual(), { noremap = true })  -- `C-a` で増加（ビジュアル）
      vim.keymap.set("v", "<C-x>", dial.dec_visual(), { noremap = true })  -- `C-x` で減少（ビジュアル）
      vim.keymap.set("v", "g<C-a>", dial.inc_gvisual(), { noremap = true })  -- 連続増加
      vim.keymap.set("v", "g<C-x>", dial.dec_gvisual(), { noremap = true })  -- 連続減少
    end,
  },
}
