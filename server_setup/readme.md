# Server Setup

Update: Mar 31, 2023

## 0. SSH-Key

`ssh-copy-id -i ~/.ssh/id_rsa.pub YOUR_USER_NAME@IP_ADDRESS_OF_THE_SERVER`

## 1. oh-my-zsh

1. Install zsh+omz

- https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
- https://ohmyz.sh/#install

```bash
# Install Zsh
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
2. Themes

`Powerlevel10k`
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```
`ZSH_THEME="powerlevel10k/powerlevel10k"`

Solve bugs:
add `unset ZSH_AUTOSUGGEST_USE_ASYNC` at the bottom of .zshrc

`myys.zsh-theme`: 
```bash
wget https://raw.githubusercontent.com/zlwang-cs/CodeBase/main/server_setup/myys.zsh-theme
mv myys.zsh-theme ~/.oh-my-zsh/custom/themes
```

`.condarc`: Add it after installing **conda**
```bash
wget https://raw.githubusercontent.com/zlwang-cs/CodeBase/main/server_setup/condarc
mv condarc .condarc
```

1. Plugins 

- git
- zsh-autosuggestions: 
  `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- zsh-syntax-highlighting:
  `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

## 2. Conda

1. Download: https://docs.conda.io/en/latest/miniconda.html#linux-installers

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh
sh Miniconda3-py39_23.1.0-1-Linux-x86_64.sh
```

2. Create Environment

```bash
conda create -n general python=3.X
```

3. PyTorch

```
```

4. *Apex*

<!-- TODO -->

5. Update Cuda Toolkit

- Google search for the runfile of the right version
- `sudo sh cuda_XXX_linux.run`
- Double check the symlink in `/usr/local/cuda`
- Add this to the .zshrc or .bashrc
```
#cuda
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export PATH=/usr/local/cuda/bin:$PATH
```


## 3. Tmux

`.tmux.conf`: 
```bash
wget https://raw.githubusercontent.com/zlwang-cs/CodeBase/main/server_setup/tmux.conf
mv tmux.conf .tmux.conf
```


## 4. Vim 

`.vimrc`: https://github.com/amix/vimrc
```bash
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh

echo "set cursorline" >> .vimrc
```






