#!/bin/sh
printf '\033c\033]0;%s\a' frog_game (4.4)
base_path="$(dirname "$(realpath "$0")")"
"$base_path/frog_game (4.4).x86_64" "$@"
