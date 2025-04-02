# Создать файл info.log, в который поместить все строки из файла /var/log/anaconda/syslog, второе поле в которых равно INFO.
#!/bin/bash
touch info.log

f1=/var/log/anaconda/syslog

if [[ ! -f "$f1" ]]
then
echo "File doesn't exist"
exit 0
fi

awk '$2 == "INFO" {print}' "$f1" >> info.log
