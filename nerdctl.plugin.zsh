if (( $+commands[nerdctl] )); then
  # If the completion file does not exist, generate it and then source it
  # Otherwise, source it and regenerate in the background 
    if [[ ! -f "$ZSH_CACHE_DIR/completions/_nerdctl" ]]; then
     if [ ${$(nerdctl completion zsh):0:1} = "#compdef" ]; then  
     	nerdctl completion zsh | tee "$ZSH_CACHE_DIR/completions/_nerdctl" >/dev/null;
      	source "$ZSH_CACHE_DIR/completions/_nerdctl"
	fi
    else
      source "$ZSH_CACHE_DIR/completions/_nerdctl"
      if [ ${$(nerdctl completion zsh):0:1} = "#compdef" ]; then  nerdctl completion zsh | tee "$ZSH_CACHE_DIR/completions/_nerdctl" >/dev/null &|; fi
  fi
fi
