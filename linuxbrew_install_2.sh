### 2 (INTERACTIVE)

# Linuxbrew
# 	>>> run interactively <<< =>	press CTRL-D to install in ~ (used this scenario)

## export PATH=/usr/local/go/bin:/home/tamara/go/bin:/usr/local/go/bin:/home/tamara/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

# echo "export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:\$PATH" >>~/.profile
# 
# echo "export MANPATH=$(brew --prefix)/share/man:\$MANPATH" >>~/.profile
# echo "export INFOPATH=$(brew --prefix)/share/info:\$INFOPATH" >>~/.profile
# echo "" >> ~/.profile

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

echo "export PATH=/home/linuxbrew/.linuxbrew/bin:\$PATH" >> ~/.profile
test -r ~/.profile && echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.profile

# ----------------------
# FZF - fuzzy completion
# ----------------------
# fzf - general-purpose command-line fuzzy finder.
brew install fzf

#anable fzf in vim
echo "set rtp+=/home/$USER/.linuxbrew/opt/fzf" >> ~/.vimrc

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install    # this is interactive and will add:
                                    # [ -f ~/.fzf.bash ] && source ~/.fzf.bash
                                    # to .bashrc
echo "" >> ~/.vimrc

# ---------------
# BASH-GIT-PROMPT
# ---------------
brew install bash-git-prompt

# making a copy, so we can customise and use the customised ~/.gitprompt.sh
if [ -f /home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share/gitprompt.sh ]; then
    cp /home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share/gitprompt.sh ~/.gitprompt.sh
fi

echo "if [ -f \"/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share/gitprompt.sh\" ]; then" >> ~/.bashrc
echo "    __GIT_PROMPT_DIR=\"/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share\"" >> ~/.bashrc
echo "  source \"/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share/gitprompt.sh\"" >> ~/.bashrc
echo "fi" >> ~/.bashrc
echo "" >> ~/.bashrc

