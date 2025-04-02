# Подсчитать общее количество строк в файлах, находящихся в директории /var/log/ и имеющих расширение log.
#!/bin/bash
dir="/var/log"
touch count.txt
cnt=0

find "$dir" -type f -name *.log | while read -r f1
do
tmp=$(awk 'END {print NR}' "$f1")
cnt=$(( $cnt + $tmp ))
echo "$cnt" > count.txt
done

cat count.txt
