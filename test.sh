#!/bin/bash

#set -e

# Extract code argument from the query map
eval "$(jq -r '@sh "export CODE=\(.code)"')"
#echo "CODE is: $CODE"

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

jq -n --arg balance "$BALANCE" '{"balance":$balance}'
