# Rust cargo path
[[ -d "$HOME/.cargo/bin:$PATH" ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Ruby Version Manager
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"      # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

