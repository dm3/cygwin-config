#!/bin/bash
# Include directives are recognized only after the merge
xrdb -merge "$HOME/.Xdefaults"
# -- tiling
exec xmonad
# -- de
#exec startkde
