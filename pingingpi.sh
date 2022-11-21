#!/bin/bash
# pingingpi.sh

DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
. "${DIR}/config.cfg"

echo "Bumping raspberry IPs to dweet.io"

# Get local IP
LOCALIP="$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')"

# Get external IP
EXTERNALIP="$(curl https://canihazip.com/s)"

# Get current server time
TIMESTAMP="$(date)"

# For paranoid to prevent automated scanning for IP on dweet.io
#IFS='.' read -r -a ip_array <<< "$EXTERNALIP"
#EXTERNALIP="${ip_array[2]}.${ip_array[3]}.${ip_array[0]}.${ip_array[1]}"

# Post data to dweet.io
wget --post-data="last_ping=${TIMESTAMP}&local_IP=${LOCALIP}&external_IP=${EXTERNALIP}" http://dweet.io/dweet/for/${dweet_id} -O /dev/null


