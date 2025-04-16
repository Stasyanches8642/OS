# Данный скрипт - скрипт обработчик.
#!/bin/bash

echo $$ > .pid
answer=1
operation="addition"

usr1()
{
operation="addition"
}

usr2()
{
operation="multiplication"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap "echo 'The process is completed'; exit 0" SIGTERM

while true
do

sleep 1
case $operation in

"addition")
answer=$((answer + 2))
echo "Current value is $answer"
;;

"multiplication")
answer=$((answer * 2))
echo "Current value is $answer"
;;

esac
done
