#!/bin/bash

# A script to run periodically in Polybar
# Executes pacman's checkupdates script
# and a git fetch on all directories in $HOME/build.
# if there are updates available it displays the count as #  #
# where the first number is the available pacman updates
# and the second the available updates in $HOME/build
# Argument: when given -v, it runs a human friendly output
# and lists all the updateable packages.

build_update_count=0

pa=$HOME/build/
verb=0

if (( $# == 1 )); then
  if [ $1 = '-v' ]; then
    verb=1
  fi
fi

updates=$(checkupdates)
cower=$(cower -u)
pacman_update_count=$(echo "$updates" | sed '/^\s*$/d' | wc -l)
aur_update_count=$(echo "$cower" | wc -l)
aur_update_count=$(($aur_update_count-1))

if [[ $verb -gt 0 ]]; then
  if [[ $pacman_update_count -le 0 ]]; then
    echo "No updates from pacman"
  else
    echo "Pacman Updates:"
    echo $updates
  fi
  if [[ $build_update_count -le 0 ]]; then
    echo "No AUR updates"
  else
    echo "AUR Updates:"
    echo $cower
  fi
elif [[ $pacman_update_count -gt 0 || $aur_update_count -gt 0 ]]; then
  echo "$pacman_update_count  $aur_update_count"
fi
