#!/bin/bash
# This script disables sleeping on lid close
SUDO=""
(( $EUID > 0 )) && SUDO="sudo -n"
function finish {
    $SUDO pmset disablesleep 0
    printf "\nSleep has been re-enabled"
}
$SUDO pmset disablesleep 1 || exit
trap finish EXIT
printf "Sleep disabled... quit script to re-enable (Command + .)\n"
while :
	do sleep 1000
done
