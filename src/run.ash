#!/usr/bin/env ash
set -e
set -o errexit

# from https://unix.stackexchange.com/a/137639
retry() {
  local n=1
  local max=10
  local delay=10
  while true; do
    "$@" && break || {
      if [ $n -lt $max ]; then
        n=$((n + 1))
        echo "Command failed. Attempt $n/$max:"
        sleep $delay
      else
        echo "The command has failed after $n attempts."
      fi
    }
  done
}
