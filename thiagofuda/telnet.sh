#!/bin/bash
porta1=80
porta2=443
echo "192.168.2.100 $porta1
hostname-1 $porta2
ahostname-2 $porta1
hostname-3 $porta2" | \
while read host port; do
  r=$(bash -c 'exec 3<> /dev/tcp/'$host'/'$port';echo $?' 2>/dev/null)
  if [ "$r" = "0" ]; then
    echo $host $port is open
  else
    echo $host $port is closed
  fi
done
