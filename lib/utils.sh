function confirm {
  while true; do

    prompt="Are you shure?"

    if [ -n "$1" ]; then
      prompt="$1"
    fi

    read -r -p "$prompt [Y/n] " input

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
  echo ""
  echo "--- $1 ---"
  echo ""
}
