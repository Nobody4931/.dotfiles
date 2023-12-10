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
