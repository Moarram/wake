#!/bin/bash
# This script disables sleeping on lid close
if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit
fi
function finish {
    pmset -bc disablesleep 0
    echo
    echo -n "Sleep has been re-enabled"
}
trap finish EXIT
pmset -bc disablesleep 1
echo "Sleep disabled... quit script to re-enable (Ctrl+C)"
while :
do
    sleep 1000
done