# Dotfiles

## Install

Install as a bare repository.

```sh
git clone --bare git@github.com:pringon/macbook-dotfiles.git $HOME/dotfiles
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout
. $HOME/.profile
dot config --local status.showUntrackedFiles no
```

At this point, any manipulation of the git repo can be done through the `dot` alias,
e.g. `dot add`, `dot checkout`, `dot commit`.

*Note: Idea was taken from [this article](https://www.atlassian.com/git/tutorials/dotfiles).*

## Misc config

### Neovim

You may also want to set up neovim by running `nvim $HOME/.config/nvim/init.vim` and then `:PlugInstall`.
