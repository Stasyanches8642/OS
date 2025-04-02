# Вывести в файл список PID всех процессов, которые были запущены командами, расположенными в /sbin/
#!/bin/bash

touch tmp.txt answer2.txt
chmod +x answer2.txt

top -b -n 1 -c > tmp.txt

awk '$12 ~ "/sbin/" {print $1}' tmp.txt > answer2.txt

rm tmp.txt
