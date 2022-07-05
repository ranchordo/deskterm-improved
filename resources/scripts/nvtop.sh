#!/bin/bash
clear
stty -echo
~/.deskterm/colorize.sh "1;33" "---GPU USAGE INFORMATION---"
echo ''
echo ''
~/.deskterm/colorize.sh "1;36" "DETECTING GPU..."
sleep 2
echo ''
nvidia-smi > /dev/null 2>&1
EXIT=$?
if [ $EXIT -ne 0 ]
	then
	~/.deskterm/colorize.sh "1;31" "NO NVIDIA GPU WAS DETECTED."
	PRIMESEL="$(sudo prime-select query)"
	~/.deskterm/colorize.sh "1;31" "PRIME-SELECT MODE IS $PRIMESEL."
	if [ $PRIMESEL != "intel" ]
		then
		echo ''
		~/.deskterm/colorize.sh "31;5" "WARNING: UNRESPONSIVE NVIDIA CARD"
		~/.deskterm/colorize.sh "31;5" "CHECK DRIVERS AND HARDWARE"
	fi
	if [ $PRIMESEL == "intel" ]
		then
		echo ''
		~/.deskterm/colorize.sh "1;32" "NVIDIA GPU behavior is correct for this prime-select mode."
	fi
	sleep infinity
fi
if [ $EXIT -eq 0 ]
	then
	~/.deskterm/colorize.sh "1;32" "NVIDIA GPU Detected Successfully. Transitioning to nvtop mode..."
	sleep 5
	echo ''
	~/.deskterm/colorize.sh "1;32" "Initializing nvtop mode..."
	nvtop
fi
stty echo
