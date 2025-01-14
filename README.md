# Config neovim based on Rocks

## Prerequisites

[Installing rocks.nvim](https://github.com/nvim-neorocks/rocks.nvim/wiki/Installing-rocks.nvim-manually,-without-the-installation-script#prerequisites)

- An up-to-date Neovim nightly installation.
- [luarocks](https://github.com/luarocks/luarocks/wiki/Download) and a Lua 5.1 installation.
- A C++17 and Rust toolchain, if you are **not** on one of the following architectures:
    - `linux-x86_64`
    - `macos-x86_64`
    - `macos-aarch64`
    - `win32-x86_64`    

## Install

- git clone https://github.com/sergey-arkhipov/nvim-rocks.git
- Start Neovim and, in cmd mode, enter:

```lua
:lua =vim.g.rocks_nvim.rocks_path
-- On Linux, this should output something like '/home/<user>/.local/share/nvim/rocks'
```

Note down the path. As usually on Linux it is `$HOME/.local/share/nvim/rocks`

Install rocks.nvim, substituting `<rocks_path>` for the path that was output in the previous step.
Can be done from terminal or, prepend with ! from nvim cmd

```bash
luarocks --lua-version=5.1 --tree <rocks_path> --server='https://nvim-neorocks.github.io/rocks-binaries/' install rocks.nvim
```
- Agree with 'Y' for Rocks sync
- Done
