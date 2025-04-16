# Задайте еще один однократный запуск скрипта из пункта 1 через 2 минуты. Консоль после этого должна оставаться свободной. Выполнив отдельную команду организуйте слежение за файлом ~/report и 
# выведите на консоль новые строки из этого файла, как только они появятся.
#!/bin/bash

prev_scr="/home/user/lab3/scr1.sh"

echo "prev_scr" | at now + 2 minutes

while true
do
read line
echo "$line"
done < <(tail -f `/report)

killall tail
