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
[n]gcc      注释
<C-a>/<C-x> incr/decr
gx          打开链接
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

```


### Link

1. [Extra Plugins](https://www.lunarvim.org/docs/plugins/extra-plugins) 
