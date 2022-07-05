#!/bin/bash

~/.deskterm/colorize.sh "1;33" "---SENSOR INFORMATION---"
echo ''
echo ''
SENSORS="$(sensors coretemp-isa-000 BAT0-acpi-0 ucsi_source_psy_USBC000:001-isa-0000)"
~/.deskterm/colorize.sh "1;36" "$SENSORS"
