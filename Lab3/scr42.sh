# Этот скрипт - вторая часть для 4-ого задания. Данный скрипт выполняет обработку созданных в первой части процессов.
#!/bin/bash

prev_scr="/home/user/lab3/scr41.sh"

$prev_scr & pr1_pid=$!
$prev_scr & pr2_pid=$!
$prev_scr & pr3_pid=$!

echo "JUST WORK OF MADEN PROCESSES:"
top -p $pr1_pid,$pr2_pid,$pr3_pid -b -n 1 | head -n 10 | tail -n 4

#systemd-run --scope -p CPUQuota=10% --user --unit=process_limit --pid=$pr1_pid
renice -n 18 -p $pr1_pid >/dev/null 2>&1

kill -9 $pr3_pid >/dev/null 2>&1

echo "CHECK %CPU OF PROCESS-1:"
top -p $pr1_pid -b -n 1 | head -n 8 | tail -n 2

kill -9 $pr1_pid >/dev/null 2>&1
kill -9 $pr2_pid >/dev/null 2>&1
