# Используя псевдофайловую систему /proc найти процесс, которому выделено больше всего оперативной памяти. Сравнить результат с выводом команды top.
#!/bin/bash

maximum=0
max_pid=0
proc=""
nm_pid=""

for pid in $(ls -d /proc/[0-9]*/ 2>/dev/null)
do
if [ -f "$pid/status" ]
then
nm_pid=$(basename "$pid")
nm=$(grep -E '^Name:' "$pid/status" | awk '{pront $2}')
rss=$(grep -E '^VmRSS:' "$pid/status" | awk '{pront $2}')

if [ -n "$rss" ] && [ "$rss" -gt "$maximum" ]
then
maximum="$rss"
max_pid="$nm_pid"
proc="$nm"
fi

fi
done

if [ "$max_pid -ne 0 ]
then
echo "INFORMATION WITH /PROC:"
echo "PID: $max_pid"
echo "Name: $proc"
echo "Memory: $maximum KB"
else
echo "Nothing to show"
fi

echo "INFORMATION WITH TOP:"
top -b -n 1 -o %MEM | head -n 8
