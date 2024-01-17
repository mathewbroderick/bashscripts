#!/bin/bash

oregonflora="https://oregonflora.org"

status=$(curl -s -o /dev/null -w "%{http_code}" $oregonflora)

if [$status -eq 200}; then
	echo "OregonFlora is up"
else
	echo "OregonFlora is down HTTP status code: $status"

fi
