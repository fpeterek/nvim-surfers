# Nvim-Surfers

Are you a complete degenerate with a TikTok-fried brain? Are you unable to pay attention for more
than the length of a TikTok and yet want to become a programmer? Are you afraid your goldfish-like
attention span is going to inhibit your chances of getting a software engineering job? Fear not,
for the solution is here. With this plugin, you can now watch Subway Surfers gameplay straight
from a Neovim split.

![Subway Surfers straight from your Nvim instance](surfers.gif)

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
        config = function()
            require('nvim-surfers').setup({
                use_tmux = false,
            })
        end
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

### Disclaimer

The built-in terminal inside of Neovim is not fast enough to render the video properly and trying
to run the command will mess up your Nvim instance, forcing you to kill the entire terminal
emulator and restart Nvim.

## Tmux integration

Using the built-in Nvim terminal didn't work all that great. However, we can also use Tmux and
create a new Tmux split which will display the Subway Surfers gameplay. This works a lot better
and the gameplay playback is now completely smooth, however, Nvim needs to be run from a Tmux
session to allow us to create a new Tmux split.

### Configuration

```lua
local plugins = {
    {
        'fpeterek/nvim-surfers',
        config = function()
            require('nvim-surfers').setup({
                use_tmux = true,
            })
        end
    },
}

require("lazy").setup(plugins)
```

### Running Nvim from Tmux

```sh
tmux new -s my-tmux-session
nvim
```

Then, just launch the playback using `:Surf`, just like you're used to.
