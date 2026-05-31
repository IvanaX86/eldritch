_nixos-rebuild-wrapper() {
  unfunction _nixos-rebuild-wrapper
  autoload -Uz +X _nixos-rebuild
  functions[_nixos-rebuild]="${functions[_nixos-rebuild]/_arguments/_arguments '--flake[flake reference]:flake path:_files'}"
  compdef _nixos-rebuild nixos-rebuild
  _nixos-rebuild "$@"
}
compdef _nixos-rebuild-wrapper nixos-rebuild
