# Данный скрипт - скрипт обработчик.
#!/bin/bash

answer=1
operation="addition"

(tail -f pipe) |
while true
do
read line
echo "$line"

if [[ "$line" == "+" ]]
then
operation="addition"

elif [[ "$line" == "'*'" ]]
then
operation="multiplication"

elif [["$line" == "QUIT" ]]
then
echo "Your result is $answer"
echo "Exit"
killall tail
killall scr51.sh
rm -f pipe
exit 0

elif [[ "$line" =~ ^[[:digit:]]+$ ]]
then
case $operation in
"addition")
answer=$((answer + line))
;;
"multiplication")
answer=$((answer * line))
;;
esac

else
echo "Wrong value!"
killall tail
killall scr51.sh
exit 1
fi

done
