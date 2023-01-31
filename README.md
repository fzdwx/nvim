# Nvim Config


## 🚀 Getting Started

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
git clone https://github.com/fzdwx/nvim ~/.config/nvim
nvim
```

## 📂 File Structure

<pre>
~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       └── spec.lua
├── init.lua
└── stylua.toml
</pre>


## Keymap 

### 1.Normal

```
[n]gcc            注释
<C-a>/<C-x>       incr/decr 
<C-u>             清空一行
<leader>a         打开 cursor word 对应的链接
gw                Seach cursor word
f/F/t/T           快速跳跃
<A-j/k>           上下移动行
<A-,/.>           切换buffer
<S-方向键>        选中

sv                向右切
sp                向下切分
sc                关闭当前
so                关闭其他
s<方向键>         聚焦到窗口
<C-方向键>        调节窗口大小

# v 模式下
</<s-tab>         调整缩进
>/<tab>
```

### 2.Lsp

```shell
<leader>ca   code-action
<leader>ci   call hierarchy
<leader>co 
<leader>cr   rename
<leader>cf   format document(in `v` mode, format range)
<leader>sl   Show line diagnostics
<leader>sc   Show cursor diagnostics
<leader>sb   Show buf diagnostics
<leader>o    Show outline
[e           Diagnostic jump prev           # Use <C-o> go back
]e           Diagnostic jump next
gd           goto definition                # Use <C-t> go back
gpd          peek definition
gh           Find the symbol's definition   # Use <C-t> go back
<C-p>        Hover doc

<leader>xx   diagnostics  info

### 3. Floaterm

```shell
# 这里自定义命令全局搜索 `runFile`
<F5>         运行文件对应的命令,例如 go: `go run `
# 这里自定义在`float_term.lua#keys`
<a-t>        float term   
<a-r>        ranger
<a-l>        lazygit
```
```


### Link

1. [Extra Plugins](https://www.lunarvim.org/docs/plugins/extra-plugins) 
