#!/bin/bash
DATE="$(date +%F)"
echo "Todays date is $DATE"

sessions_count=$(who |wc -l)

echo "Total number of active sessions $sessions_count"

echo -e "Total Number Of Active Sessions \e[32m $sessions_count\e[0m"
