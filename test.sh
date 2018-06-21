#!/bin/bash

#set -e

# Extract code argument from the query map
eval "$(jq -r '@sh "export CODE=\(.code)"')"

case $CODE in
     1)
        BALANCE=100
        ;;
     2)
        BALANCE=0
        ;;
     *)
        BALANCE=0
        ;;
esac
export BALANCE

jq -n --arg the_balance "$BALANCE" '{"balance":$the_balance}'
