<h1 align="center">
    Vim HexMode - Enhancing Vim to support hex mode displaying/editing
</h1>

## Why Vim HexMode
**Notepad++** has a plugin [Converter] can display/edit files in their actual hexadecimal format.
Vim as the one of the most popular editor in Linux, can not do that, but I need this feature.
So I decided to write a plugin to enhance Vim to realize this feature.

## Implementation
We can utilize the `xxd` shell command to transfrom the file in Vim to hex representation like below:
`:%!xxd`

`:` enters command-line mode in Vim, `%` matches whole file as a range, `!` filters that range through an
external command, `xxd` is that external shell command.

You can go back with `-r` option of `xxd`, so:
`:%!xxd -r`

It would be very tdious to do so, so creating a Vim plugin is a better way to implment it, that means you
can easily toggle back-and-forth between hex and non-hex mode.

## Installation
It is recommended to use the [vim-plug](https://github.com/junegunn/vim-plug) to install this pluging
```vim
Plug 'lT-Tl/vim-hexmode'
```

## Usage

## License
Published under the GNU GPLv3.
