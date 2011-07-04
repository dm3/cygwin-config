#!/bin/bash
# Include directives are recognized only after the merge
xrdb -merge "$HOME/.Xdefaults"
amixer set 'Master' 60 unmute
amixer set 'Docking Mic' 0 mute
amixer set 'External Mic' 0 mute
amixer set 'Internal Mic' 0 mute
# -- tiling
exec xmonad
# -- de
#exec startkde
