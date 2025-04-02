# Написать скрипт, определяющий три процесса, которые за 1 минуту, прошедшую с момента запуска скрипта, считали максимальное количество байт из устройства хранения данных.
# Скрипт должен выводить PID, строки запуска и объем считанных данных, разделенные двоеточием.
#!/bin/bash

touch answer7.txt start.txt final.txt
chmod +x answer7.txt
>answer7.txt
>start.txt
>final.txt

for pid in $(ls -d /proc/[0-9]*/ 2>/dev/null)
do
nm_pid=$(basename "$pid")
if [[ -r "$pid/io" ]]
then
bytes=$(awk '/read_bytes:/ {print $2}' "$pid/io" 2>/dev/null)
[[ -n "$bytes" ]] && echo "$nm_pid:$bytes" >> start.txt
fi
done

sleep 60

for pid in $(ls -d /proc/[0-9]*/ 2>/dev/null)
do
nm_pid=$(basename "$pid")
if [[ -r "$pid/io" ]]
then
bytes=$(awk '/read_bytes:/ {print $2}' "$pid/io" 2>/dev/null)
[[ -n "$bytes" ]] && echo "$nm_pid:$bytes" >> final.txt
fi
done

awk -F: 'NR==FNR {start[$1] = $2; next} $1 in start {print $1 ":" ($2 - start[$1])}'\
 start.txt final.txt | sort -t: -k 2 -nr | head in 3 > answer7.txt
