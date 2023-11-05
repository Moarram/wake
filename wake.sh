#!/bin/bash
# This script disables sleeping on lid close and re-enables it when quit
SUDO=""
(( $EUID > 0 )) && SUDO="sudo -n" # set $SUDO if we aren't running as root

function finish {
    ret=$? # return code
    $SUDO pmset disablesleep 0 # enable sleep
    printf "Sleep \e[32menabled\e[0m"
    exit $ret
}

$SUDO pmset disablesleep 1 || exit 1 # disable sleep, exit if failed

trap 'exit 129' HUP # catch hangup
trap 'exit 130' INT # catch interrupt
trap 'exit 131' QUIT # catch quit
trap 'exit 143' TERM # catch terminate
trap finish EXIT # run function when script exits

printf "Sleep \e[31mdisabled\e[0m\n\e[2mPress any key to re-enable...\e[0m\n"
read -rsn1 # wait for keypress
