PROMPT='
┌─[%F{blue}%~%f]$(get_ip_address)$(get_current_target) $(git_prompt_info)
└─ '

RPROMPT='[%F{red}%?%f]'

get_ip_address() {
  if [[ -n "$(ifconfig tun0 2>/dev/null)" ]]; then
    echo " [%{$fg[green]%}$(ifconfig tun0 | awk '/inet / {print $2}')%{$reset_color%}]"
  else
    echo ""
  fi
}

get_current_target() {
    if [[ -n "${TARGET_HOSTNAME}" && -n "${TARGET_IP}" ]]; then
        echo "[%F{red}$TARGET_HOSTNAME $TARGET_IP%f]"
    elif [[ -n "${TARGET_HOSTNAME}" ]]; then
        echo "[%F{red}$TARGET_HOSTNAME%f]"
    elif [[ -n "${TARGET_IP}" ]]; then
        echo "[%F{red}$TARGET_IP%f]"
    else
        echo ""
    fi
}
