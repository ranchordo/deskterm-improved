#!/bin/bash
~/.deskterm/colorize.sh "1;33" "---DISK USAGE INFORMATION---"
echo ''
echo ''
~/.deskterm/colorize.sh "1;36" "$(df)"
