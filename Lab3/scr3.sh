# Задайте запуск скрипта из пункта 1 в каждую пятую минут каждого часа в день недели, в который вы будете выполнять работу.
#!/bin/bash

first_scr="/home/user/lab3/scr1.sh"
day="Thu"

echo "5 * * * $day $first_scr" | crontab -
