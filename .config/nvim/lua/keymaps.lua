vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "ファイル検索" })
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "テキスト検索" })
vim.keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>", { desc = "バッファ一覧" })
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "カーソル下の単語を検索" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "ヘルプ検索" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git ステータス" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP 参照" })
