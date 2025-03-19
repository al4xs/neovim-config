# AstroNvim Template

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/al4xs/neovim-config ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

# 🌳 Fonts Terminal Root
Fonts Terminal Root - My fonts preferred
> A quick alacternative to [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)!

---

# 🌒 Installation
```bash
git clone --depth=1 https://github.com/terroo/fonts
cd fonts
mv fonts ~/.local/share
fc-cache -fv
```
Enjoy!

If you prefer to use a script to install, run:
> You must have the [Lua Programming Language](https://github.com/lua/lua) installed on your system!

```bash
git clone --depth=1 https://github.com/terroo/fonts
cd fonts
lua install.lua
```
