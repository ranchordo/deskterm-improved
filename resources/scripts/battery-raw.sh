#!/bin/bash
~/.deskterm/colorize.sh "1;33" "---BATTERY INFORMATION---"
echo ''
echo ''
if [ -f "/sys/class/power_supply/BAT0/charge_now" ]; then
~/.deskterm/colorize.sh "1;34" "Ideal capacity:   $(cat /sys/class/power_supply/BAT0/charge_full_design) [uAh]"
~/.deskterm/colorize.sh "1;34" "Current capacity: $(cat /sys/class/power_supply/BAT0/charge_full) [uAh]"
echo ''
~/.deskterm/colorize.sh "1;32" "Current charge:   $(cat /sys/class/power_supply/BAT0/charge_now) [uAh]"
echo ''
~/.deskterm/colorize.sh "1;35" "Battery current:  $(cat /sys/class/power_supply/BAT0/current_now) [uA]"
echo ''
echo ''
~/.deskterm/colorize.sh "1;31" "STATUS:           $(cat /sys/class/power_supply/BAT0/status)"
CHARGENOW="$(cat /sys/class/power_supply/BAT0/charge_now)"
CHARGETOTAL="$(cat /sys/class/power_supply/BAT0/charge_full)"
echo ''
CHRG=$(cat /sys/class/power_supply/BAT0/charge_now)
CURRENT=$(cat /sys/class/power_supply/BAT0/current_now)
TIME=$(printf "%.2f" $(echo "$CHRG / $CURRENT" | bc -l))
~/.deskterm/colorize.sh "1;34" "Time remaining:   $TIME [h]"
echo ''

PERC=$(echo "100.0 * ($CHARGENOW / $CHARGETOTAL)" | bc -l)
BARFULL="████████████████████"
BARSPAC="                    "
NUM=$(printf "%.0f" $(echo "$PERC / 5" | bc -l))
BAREXPR=$(echo "${BARFULL:0:$(echo $NUM | bc -l)}${BARSPAC:0:$(echo 20-$NUM | bc -l)}")
BARCOLOR="1;32"
if [ $(echo " $PERC <= 15.0" | bc -l) -eq 1 ]
	then
	BARCOLOR="0;31"
fi
printf "\033["$BARCOLOR"mCharge:           %.2f%%\033[0m\n" "$PERC"
echo ''
~/.deskterm/colorize.sh "$BARCOLOR" "┏$BAREXPR┓"
~/.deskterm/colorize.sh "$BARCOLOR" "┗$BAREXPR┛"
else
~/.deskterm/colorize.sh "1;33" "No battery detected."
fi
