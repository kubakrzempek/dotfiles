export N_PREFIX="$HOME/.n_nodes"

autoload -U add-zsh-hook

load_node_version() {
  local node_version=".node-version"
  if [ -e "$node_version" ]; then
    n "$(cat "${node_version}")"
  fi
}
add-zsh-hook chpwd load_node_version
load_node_version
