# Dotfiles

## Install

Install as a bare repository.

```sh
git clone --bare git@bbgithub.dev.bloomberg.com:dgoje/dotfiles.git $HOME/dotfiles
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout
. $HOME/.profile
```

At this point, any manipulation of the git repo can be done through the `config` alias,
e.g. `config add`, `config checkout`, `config commit`.

*Note: Idea was taken from [this article](https://www.atlassian.com/git/tutorials/dotfiles).*

## Misc config

### Neovim

You may also want to set up neovim by running `extern nvim $HOME/.config/nvim/init.vim` and then `:PlugInstall`.
