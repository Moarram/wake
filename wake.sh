#!/bin/bash
# This script disables sleeping on lid close and re-enables it when quit
SUDO=""
(( $EUID > 0 )) && SUDO="sudo -n" # set $SUDO if we aren't running as root
function finish {
    $SUDO pmset disablesleep 0 # enable sleep
    printf "Sleep \e[32menabled\e[0m"
}
$SUDO pmset disablesleep 1 || exit # disable sleep, exit if failed
trap finish EXIT # run function when script exits
printf "Sleep \e[31mdisabled\e[0m\n\e[2mPress any key to re-enable...\e[0m\n"
read -rsn1 # wait for keypress
