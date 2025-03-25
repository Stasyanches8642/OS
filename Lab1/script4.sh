#!/bin/bash
UserDir="$HOME"
CurrDir="$(pwd)"

if [[ "$UserDir" == "$CurrDir" ]]
then
echo "$UserDir"
exit 0
else
echo "ERROR"
exit 1
fi
