#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Define the directory for Polybar configuration
dir="$HOME/.config/polybar"

echo "---" | tee -a /tmp/polybar.log

# TODO - Check to show polybar on all monitors
#
# Check if xrandr is available
# if type "xrandr" > /dev/null; then
#   # Launch Polybar for each connected monitor
#   for m in $(polybar --list-monitors | cut -d":" -f1); do
#     MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybar.log & disown
#   done
# else
#   # Launch Polybar without specifying a monitor
#   polybar --reload main 2>&1 | tee -a /tmp/polybar.log & disown
# fi

polybar --reload main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."

