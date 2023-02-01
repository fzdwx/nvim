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


## ⌨ Keymap 

### 1.Normal

```
# 移动
<A-j/k>           上下移动行
<A-,/.>           切换buffer
f/F/t/T           快速跳跃
z-<left/right>    跳转到上个/下个位置

# 窗口
sv                向右切
sp                向下切分
sc                关闭当前
so                关闭其他
s<方向键>         聚焦到窗口
<C-方向键>        调节窗口大小

# 文本编辑
u                 撤销
<C-r>             撤销上一次 u 命令
[n]gcc            注释
<C-A>/<C-X>       增加/减少数字 或 切换bool
<C-U>             清空一行
<leader>a         打开 cursor word 对应的链接
gw                Seach cursor word
<S-方向键>        选中

# 文本对象 - c,d,v,y 等命令后接文本对象，一般为：<范围 i/a><类型>
$                   到行末
0                   到行首
^                   到行首非空字符
tx                  光标位置到字符 x 之前
fx                  光标位置到字符 x 之处
iw                  整个单词（不包括分隔符）
aw                  整个单词（包括分隔符）
iW                  整个 WORD（不包括分隔符）
aW                  整个 WORD（包括分隔符）
is                  整个句子（不包括分隔符）
as                  整个句子（包括分隔符）
ip                  整个段落（不包括前后空白行）
ap                  整个段落（包括前后空白行）
ib                  小括号内
ab                  小括号内（包含小括号本身）
iB                  大括号内
aB                  大括号内（包含大括号本身）
i)                  小括号内
a)                  小括号内（包含小括号本身）
i]                  中括号内
a]                  中括号内（包含中括号本身）
i}                  大括号内
a}                  大括号内（包含大括号本身）
i'                  单引号内
a'                  单引号内（包含单引号本身）
i"                  双引号内
a"                  双引号内（包含双引号本身）
2i)                 往外两层小括号内
2a)                 往外两层小括号内（包含小括号本身）
2f)                 到第二个小括号处
2t)                 到第二个小括号前

# v 模式下
</<s-tab>         调整缩进
>/<tab>
```

### 2.Lsp

```shell
<leader>ca        code-action
<leader>ci        call hierarchy
<leader>co 
<leader>cr        rename
<leader>cf        format document(in `v` mode, format range)
<leader>sl        Show line diagnostics
<leader>sc        Show cursor diagnostics
<leader>sb        Show buf diagnostics
<leader>o         Show outline
[e                Diagnostic jump prev           # Use <C-o> go back
]e                Diagnostic jump next
gd                goto definition                # Use <C-t> go back
gpd               peek definition
gh                Find the symbol's definition   # Use <C-t> go back
<C-p>             Hover doc

<leader>xx   diagnostics  info
```

### 3. Floaterm

```shell
# 这里自定义命令全局搜索 `runFile`
<F5>         运行文件对应的命令,例如 go: `go run `
# 这里自定义在`float_term.lua#keys`
<a-t>        float term   
<a-r>        ranger
<a-l>        lazygit
```


### Link

1. [Extra Plugins](https://www.lunarvim.org/docs/plugins/extra-plugins) 
