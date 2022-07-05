#!/bin/bash
stty rows $(tput lines) cols 100
~/.deskterm/colorize.sh "1;33" "---PROCESS INFORMATION---"
echo ''
echo ''
~/.deskterm/colorize.sh "1;33" "BY CPU:"

{ read -d '' result; }< <(top -bn 1 | grep "^ " | awk '{ printf("%-8s  %-8s  %-8s  %-8s\n", $1, $9, $10, $NF); }' | head -n 11)

~/.deskterm/colorize.sh "1;36" "$result"
echo ''
~/.deskterm/colorize.sh "1;33" "BY MEMORY:"
{ read -d '' result; }< <(top -o +%MEM -bn 1 | grep "^ " | awk '{ printf("%-8s  %-8s  %-8s  %-8s\n", $1, $9, $10, $NF); }' | head -n 11)
~/.deskterm/colorize.sh "1;36" "$result"

