#!/bin/bash
~/.deskterm/colorize.sh "1;33" "---INTERNET CONNECTION INFORMATION---"
echo ''
echo ''

WARP="$(warp-cli status | grep --color=never Status | head -n 1)"
WARPSTATUS="${WARP/Status update: /}"
WARPCOLOR="1;31"
if [ "$WARPSTATUS" == "Disconnected" ]
	then
	WARPCOLOR="1;33"
fi
if [ "$WARPSTATUS" == "Connected" ]
	then
	WARPCOLOR="1;32"
fi
~/.deskterm/colorize.sh "$WARPCOLOR" "CLOUDFLARE WARP STATUS: $WARPSTATUS"
echo ''
echo ''
~/.deskterm/colorize.sh "1;36" "WIFI INFORMATION:"
~/.deskterm/colorize.sh "1;34" "$(iw dev wlp0s20f3 link)"
echo ''
~/.deskterm/colorize.sh "1;36" "IP ROUTES:"
~/.deskterm/colorize.sh "1;34" "$(ip route)"
