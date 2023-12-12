# Dotfiles

My configuration files for different Linux programs

## Installation

You will need [Git](https://git-scm.com/) and [GNU Stow](https://www.gnu.org/software/stow/)

1. Clone the repository into your `$HOME` directory or `~`

```bash
$ git clone https://github.com/Nobody4931/.dotfiles.git ~
```

2. Run `stow` to symlink everything or a specific package

```bash
$ stow */ # The '*/' is to stow directories only
```

```bash
$ stow zsh
```

## Notes

It is recommended to unstow all packages before modifying any configuration files.

If a package is deleted or renamed before all existing symlinks are unlinked, it will result in dangling symlinks.

```bash
$ stow -D */
```

## Dependencies

In order for some of my config files to work properly, a few dependencies need to be installed.

Most, if not all, of the dependencies can be installed via your distribution's package manager.

### Zsh

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - prompt suggestions while typing
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - perform syntax highlighting while typing
* [fzf](https://github.com/junegunn/fzf) - fuzzy search command history
* [OpenSSH](https://www.openssh.com/) - start ssh agent automatically
* [Reflector](https://wiki.archlinux.org/title/reflector) - update arch linux mirrorlist

### Tmux

* [ACPI](https://wiki.archlinux.org/title/ACPI_modules) (preinstalled on most distros) - show battery percentage
