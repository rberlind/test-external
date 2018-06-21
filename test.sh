#!/bin/bash

#set -e

# Extract code argument from the query map
eval "$(jq -r '@sh "export CODE=\(.code)"')"

case $CODE in
     1)
        export BALANCE=100
        ;;
     2)
        export BALANCE=0
        ;;
     *)
        export BALANCE=0
        ;;
esac

jq -n --arg the_balance "$BALANCE" '{"balance":$the_balance}'
