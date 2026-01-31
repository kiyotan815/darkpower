local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- GPUレンダリングを強制（4070 Tiのパワーを使う）
config.front_end = "WebGpu" 
config.color_scheme = 'Nightfly (Gogh)' -- 視認性の高いダークテーマ

-- フォント設定（あとでJetBrains Mono Nerd Fontなどを入れると綺麗になります）
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 12.0

-- 画面分割などのキーバインド (Ctrl+Shift+L で右分割、Ctrl+Shift+D で下分割)
config.keys = {
  { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
}

-- タブバーを隠さない（状態を把握しやすくするため）
config.hide_tab_bar_if_only_one_tab = false

return config
