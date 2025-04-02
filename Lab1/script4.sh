# Если скрипт запущен из домашнего директория, вывести на экран путь к домашнему директорию и 
# выйти с кодом 0. В противном случае вывести сообщение об ошибке и выйти с кодом 1.
#!/bin/bash
UserDir="$HOME"
CurrDir="$(pwd)"

if [[ "$UserDir" == "$CurrDir" ]]
then
echo "$UserDir"
exit 0
else
echo "ERROR"
exit 1
fi
