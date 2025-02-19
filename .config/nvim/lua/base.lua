-- 基本設定
local set = vim.opt
local map = vim.keymap.set
local g = vim.g

-- ビジュアルベルの設定
set.visualbell = true

-- リーダーキーの設定
g.mapleader = " "

-- Vimの互換モードを無効化
if vim.fn.has("compatible") == 1 then
  set.compatible = false
end

-- シンタックスハイライト
vim.cmd("syntax enable")

-- クリップボード共有
set.clipboard = "unnamedplus"

-- バックアップ・スワップファイルの無効化
set.backup = false  -- バックアップファイルを作らない
set.writebackup = false  -- 書き込み時のバックアップを作らない
set.swapfile = false  -- スワップファイルを無効化
set.autoread = true
set.hidden = true

-- UI 設定
set.showcmd = true
set.number = true
set.virtualedit = "onemore"
set.laststatus = 2
set.wrapscan = true
set.hlsearch = true
set.completeopt = { "menuone", "preview" }

-- 検索時の設定
set.ignorecase = true
set.smartcase = true
set.incsearch = true

-- タブとインデント
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.smartindent = true
set.autoindent = true

-- キーマッピング
map("i", "jj", "<ESC>")
map("n", ":", ";")
map("n", ";", ":")
map("n", "<ESC><ESC>", ":noh<CR>", { silent = true })
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "gj", "j")
map("n", "gk", "k")
map("n", "<leader>w", ":w<CR>", { silent = true })
map("n", "<leader>q", ":q!<CR>", { silent = true })
map("n", "<S-h>", "^", { noremap = true })
map("n", "<S-l>", "$", { noremap = true })

-- ウィンドウ分割
map("n", "ss", "<C-w>s")
map("n", "sv", "<C-w>v")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")
map("n", "sh", "<C-w>h")
map("n", "sJ", "<C-w>J")
map("n", "sK", "<C-w>K")
map("n", "sL", "<C-w>L")
map("n", "sH", "<C-w>H")

-- タブ切り替え
map("n", "<S-Tab>", ":tabprev<CR>", { silent = true })
map("n", "<Tab>", ":tabnext<CR>", { silent = true })

-- ウィンドウ操作
map("n", "sN", ":bn<CR>", { silent = true })
map("n", "sP", ":bp<CR>", { silent = true })
map("n", "st", ":tabnew<CR>", { silent = true })
map("n", "sq", ":q<CR>", { silent = true })
map("n", "sQ", ":bd<CR>", { silent = true })

-- サブモード（ウィンドウリサイズ）
map("n", "s>", "<C-w>>")
map("n", "s<", "<C-w><")
map("n", "s+", "<C-w>+")
map("n", "s-", "<C-w>-")

-- ファイルエンコーディング
set.encoding = "utf-8"
set.fileformats = { "unix", "dos", "mac" }
