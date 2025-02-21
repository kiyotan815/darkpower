return {
  {
    "hrsh7th/nvim-cmp",  -- 補完エンジン
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP の補完
      "L3MON4D3/LuaSnip",     -- スニペット補完
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(), -- 次の補完候補
          ["<C-p>"] = cmp.mapping.select_prev_item(), -- 前の補完候補
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 確定
        }),
        sources = cmp.config.sources({
         { name = "nvim_lsp" },  -- LSP の補完
          { name = "buffer" },    -- バッファ内の単語
          { name = "path" },      -- ファイルパス補完
        }),
      })
    end
  },
}
