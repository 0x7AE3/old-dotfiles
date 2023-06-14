# Setup Guide

## Unix

Run [setup.sh](unix/setup.sh)

To configure SSH with Github, see [here](https://gist.github.com/cham11ng/fee11faf2f41667fad3c9a8c69fde2c2) or [here](https://gist.github.com/juanique/4092969)

## Windows 🤢

1. Download the right `git` [binary](https://git-scm.com/download/win), or instead run in Powershell 

```powershell
winget install --id Git.Git -e --source winget
```

2. Now clone this repository using your newly installed `git` (you may have to close and reopen Powershell)

```powershell
git clone https://github.com/0x7AE3/dotfiles
```

3. Now add [windows/unix-commands](https://github.com/0x7AE3/dotfiles/tree/master/windows/unix-commands) to the User `PATH`. You should move it to a reasonable location such as your home directory, which is `$HOME` in Powershell 

4. Next install `vim` from [here](https://www.vim.org/download.php); no way are we building from source on Windows... same with `neovim` from [here](https://github.com/neovim/neovim)

5. Next install `vim-plug` for `vim` and `neovim`

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force`

iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force`
```

6. Now install Windows Terminal (if not already installed)

```powershell
winget install Microsoft.WindowsTerminal
```

7. Now we can ditch the garbage Powershell and use Windows Terminal. Copy [.vimrc](https://github.com/0x7AE3/dotfiles/tree/master/windows/vim/.vimrc) to the home directory, which is `%USERPROFILE%` in Windows Terminal. Do the same with [init.vim](https://github.com/0x7AE3/dotfiles/tree/master/windows/nvim/init.vim) to `%LOCALAPPDATA%`

8. Open a `vim` session and run `:PlugInstall`. Do the same in `nvim`

9. Configure `git` with 

```bash
git config --global user.name "andy d"

git config --global user.email "email@gmail.com"
```

9. To configure SSH with Github, see [SSH.md](https://github.com/0x7AE3/dotfiles/tree/master/windows)
