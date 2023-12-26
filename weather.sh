#!/bin/bash
#coords for albany, corvallis, bozeman, and tucson
towns=("44.6365,123.1059" "44.5646,123.2620" "45.6793,111.0373" "32.2540,110.9742")

for coord in "${towns[@]}"; do
    IFS="," read -r lat long <<< "$coord"
    temp="$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&hourly=temperature_2m,precipitation_probability,rain,showers,cloud_cover" | jq -r '.hourly.temperature_2m[0].value')
    echo "$temp"
done