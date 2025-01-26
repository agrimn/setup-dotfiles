# setup-dotfiles
My dot files - One day I plan on automating these installation steps so I can drop a script on a new mac like a 🥷


## Installation steps
1. Install Iterm : https://iterm2.com/
2. Set Iterm themes via Settings -> Profile tab -> Colors -> Solarized Dark
3. Install Zsh: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
4. Install OhMyZsh: 
   ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
5. Install the fonts: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k 
6. Install Powerlevel10k:
    ```
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    ```
7. Copy over the ~/.zshrc file and `source ~/.zshrc`
9.  Install neovim - `brew install neovim`
10. Install Tmux - `brew install tmux`
11. Install the fuzzy finder - `brew install fzf`
