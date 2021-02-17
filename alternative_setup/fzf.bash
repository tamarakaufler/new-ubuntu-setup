# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tamara/.linuxbrew/opt/fzf/bin* ]]; then
  export PATH="$PATH:/home/tamara/.linuxbrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tamara/.linuxbrew/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/tamara/.linuxbrew/opt/fzf/shell/key-bindings.bash"

