# В параметрах при запуске скрипта передаются три целых числа. Вывести максимальное из них.
#!/bin/bash

max="$1"
if [[ "$2" -gt "$max" ]]
then
max="$2"
fi

if [[ "$3" -gt "$max" ]]
then
max="$3"
fi

echo "$max"
