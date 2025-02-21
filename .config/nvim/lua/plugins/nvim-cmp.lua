return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",            -- スニペットエンジン
      "saadparwaiz1/cmp_luasnip",    -- `luasnip` との連携
      "hrsh7th/cmp-nvim-lsp",        -- LSP からの補完
      "hrsh7th/cmp-buffer",          -- バッファ内の補完
      "hrsh7th/cmp-path",            -- パスの補完
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)  -- 🔥 LSP からのスニペットを展開
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },  -- 🔥 LSP からの補完（useEffect など）
          { name = "luasnip" },   -- 🔥 スニペット補完
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
