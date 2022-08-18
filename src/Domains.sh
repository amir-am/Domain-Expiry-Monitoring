#!/bin/bash

result="{\"key\":["
domains="DOMAIN1 DOMAIN2 DOMAIN3"
now=$(date +%s $now)

for domain in $domains; do
    date=$(whois $domain 2>/dev/null | grep -i 'Expir' | head -1 | grep -o "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}")
    if [[ ! -z "$date" ]]; then
        target=$(date +%s -d $date)
        days=$(($target - $now))
        if [ $days -gt 0 ]; then
            result+="{\"domain\":\"$domain\","
            days=$(($days / 86400))
            result+="\"days\":$days}, "
        fi
    fi
done
echo ${result::-2}"]}"
