#!/bin/bash
# Power management script
# asks what option you choose using dmenu
echo -e "-\nsuspend\nshutdown\nreboot" | dmenu | (
  read in;
  if [[ "$in" != "-" && "$in" != "" ]] ; then
    $HOME/software/utils/power/lock.sh && systemctl $in;
  fi
)
