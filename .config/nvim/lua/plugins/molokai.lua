return {
  {
    "fabius/molokai.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme molokai")
    end
  },
}
