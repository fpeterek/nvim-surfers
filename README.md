# Nvim-Surfers

Are you a complete degenerate with a TikTok-fried brain? Are you unable to pay attention for more
than the length of a TikTok and yet want to become a programmer? Are you afraid your goldfish-like
attention span is going to inhibit your chances of getting a software engineering job? Fear not,
for the solution is here. With this plugin, you can now watch Subway Surfers gameplay straight
from a Neovim split.

## Installation

### Dependencies

The plugin requires `libcaca` and `mplayer` to be installed locally. Please, install those using
your distro's package manager.

```sh
sudo pacman -S libcaca mplayer
```

### Plugin Installation

Just install the plugin using your favorite package manager. No further setup necessary.

```lua
local plugins = {
    {
        'fpeterek/nvim-surfers',
        dir = '/home/fpeterek/Documents/nvim-surfers'
    },
}

require("lazy").setup(plugins)
```

## Usage

Run

```vim
:Surf
```

Alternatively, you can setup a keyboard shortcut in case Subway Surfers gameplay is absolutely
essential for your survival.

```lua
vim.api.nvim_set_keymap('n', '<leader>ss', '<cmd>Surf<cr>', { noremap=true })
```

## Disclaimer

The built-in terminal inside of Neovim is not fast enough to render the video properly and trying
to run the command will mess up your Nvim instance, forcing you to kill the entire terminal
emulator and restart Nvim. Don't use it seriously. For this reason, the code is also unpolished,
no edge cases are handled, etc...
