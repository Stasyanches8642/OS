# Для всех зарегистрированных в данный момент в системе процессов определить среднее время непрерывного использования процессора (CPU_burst) и вывести в один файл строки 
# ProcessID=PID : Parent_ProcessID=PPID : Average_Running_Time=ART. Значения PPid взять из файлов status, которые находятся в директориях с названиями, соответствующими 
# PID процессов в /proc. Значения ART получить, разделив значение sum_exec_runtime на nr_switches, взятые из файлов sched в этих же директориях. 
# Отсортировать эти строки по идентификаторам родительских процессов.
#!/bin/bash

touch answer4.txt
chmod +x answer4.txt
>answer4.txt

for pid in $(ls -d /proc/[0-9]*/ 2>/dev/null)
do

if [ -f "$pid/status" ]
then
ppid=$(awk 'NR==5 {print $2}' "$pid/status")
else
continue
fi

if [ -f "$pid/sched" ]
then
ser=$(awk 'NR==5 {print $3}' "$pid/sched")
nr=$(awk 'NR==7 {print $3}' "$pid/sched")

if [ "$nr" != "0" ]
then
art=$(echo "scale=4; $ser / $nr" | bc)
else
art=0
fi

else
continue
fi

clear_pid=$(basename "$pis")
echo "ProcessID=$clear_pid : Parent_ProcessID=$ppid : Average_Running_Time=$art" >> answer4.txt

done

sort -t "=" -k 3 -n answer4.txt -o answer4.txt
