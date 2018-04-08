# utils
A collection of small utilities that I wrote for personal use.

These ~~are probably~~ may be hacky.

## Arch News
A small python util that's supposed to run periodically in something like Polybar.
It reads the arch news RSS feed and prints the title of the newest entry if it was posted within the given timespan of days.

**Arguments**: give the number of days to look back, if nothing is given, 10 is the default. 

## Updates
A script that's supposed to run periodically in something like Polybar.
It executes `pacman`'s `checkupdates` as well as a `git fetch` on all directories in `$HOME/build` and outputs the update counts as "pacman:$HOME/build".

**Arguments**: given `-v`, it produces human friendly output, listing the updateable packages.

**Helpers**: you can symlink `updateable.sh` into `/usr/bin`, to use `updates.sh -v` as a CLI-Utility comfortably.

## Power
A script that when Shift+Mod+P is pressed, uses `dmenu` to ask what to do.

It automatically engages `i3lock` with fancy arguments when suspended.
