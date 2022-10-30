function confirm {
  while true; do

    prompt="Are you shure?"

    if [ -n "$1" ]; then
      prompt="$1"
    fi

    printf '\n'
    read -r -p "$prompt [Y/n] " input
    printf '\n'

    case $input in
    [yY][eE][sS] | [yY])
      return 0
      break
      ;;
    [nN][oO] | [nN])
      return 1
      break
      ;;
    *)
      echo "Invalid input"
      ;;
    esac
  done
}

function header {
  purple='\033[0;35m'
  no_color='\033[0m'
  printf "\n\n$purple--- $1 ---$no_color\n\n"
  sleep 1
}
