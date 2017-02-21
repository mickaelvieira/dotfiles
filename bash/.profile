# Rust cargo path
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

# OPAM configuration
[[ -s "$HOME/.opam/opam-init/init.sh" ]] && source "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true

# Ruby Version Manager
# Stupid rvm MUST be last
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"      # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

