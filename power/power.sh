#!/bin/bash
# Power management script
# asks what option you choose using dmenu
echo -e "-\nsuspend\npoweroff\nreboot" | dmenu | (
  read in;
  if [[ "$in" != "-" && "$in" != "" ]] ; then
    systemctl "$in"
  fi
)
