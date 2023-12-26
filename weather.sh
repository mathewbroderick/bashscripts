#!/bin/bash
# Coords for Albany, Corvallis, Bozeman, and Tucson
towns=("44.6365,123.1059,Albany" "44.5646,123.2620,Corvallis" "45.6793,111.0373,Bozeman" "32.2540,110.9742,Tucson")

for coord in "${towns[@]}"; do
    IFS="," read -r lat long town <<< "$coord"
    temp=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current=temperature_2m,precipitation_probability,rain,showers,cloud_cover&timezone=auto&temperature_unit=fahrenheit" | jq -r '.current.temperature_2m')
    time=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current=temperature_2m,precipitation_probability,rain,showers,cloud_cover&timezone=auto&temperature_unit=fahrenheit" | jq -r '.current.time')
    echo "The temperature in $town at $time is: $temp°F"
done
