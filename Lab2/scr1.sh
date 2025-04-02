# Посчитать количество процессов, запущенных пользователем user, и вывести в файл получившееся число, а затем пары PID:команда для таких процессов.
#!/bin/bash

touch tmp.txt answer1.txt

chmod +x tmp.txt answer1.txt

top -b -n 1 -u root > tmp.txt

cnt=$(wc -l < tmp.txt)
length=$(( "$cnt" - 5 ))

echo "$length" > answer1.txt
awk '{print $1, ":", $12}' <(tail -n +8 tmp.txt) >> answer1.txt

rm tmp.txt
