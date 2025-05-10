# Neovimの設定ファイル
```bash
.
├── init.lua # Lazyの読み込みなど 
├── lua
│   ├── keymap.lua # 基本的なキーバインド設定
│   └── plugins # プラグイン群
└── README.md
```

## プラグイン
```
barbar    : 上部に開いたファイルを保持
hlchunk   : インデントの確認
lualine   : 下部のステータスラインをいい感じに
neo-tree  : ファイル群を表示する
noice     : コマンドラインとか通知がいい感じに
```

## その他
### 依存関係
```
# telescopeの全文検索に必要
$ brew install ripgrep
```
### Terminal(zsh)
```
Theme: Iceberg
Font: JetBrainsMono Nerd Font Mono
```
### tmux
~/.tmux.conf
```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Keybind
bind e if-shell -F "#{==:#{pane_synchronized},0}" "set synchronize-panes on" "set synchronize-panes off"

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

