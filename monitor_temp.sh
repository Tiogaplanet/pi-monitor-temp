#!/bin/bash
# Display the CPU and GPU temperature of the Raspberry Pi 3
# Author: Samuel Trassare (https://github.com/Tiogaplanet) based on original script by Vivek Gite <cyberciti.biz> under GPL v2.x+
# Requires bc for proper formatting of the CPU temperature.

echo "$(date) @ $(hostname)"
echo "Press [ctrl+c] to end monitoring"

while true
do
  cpu=$(echo "scale=1; `cat /sys/class/thermal/thermal_zone0/temp` / 1000.0" | bc)
  echo ""
  echo "CPU => $cpu'C"
  echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp | cut -d = -f2)"
  sleep 3s
done
