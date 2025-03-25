# Создать full.log, в который вывести строки файла /var/log/anaconda/X.log, содержащие предупреждения и информационные сообщения, 
# заменив маркеры предупреждений и информационных сообщений на слова Warning: и Information:, чтобы в получившемся файле сначала шли все предупреждения, 
# а потом все информационные сообщения. Вывести этот файл на экран.
#!/bin/bash
touch full.log

f1=/var/log/anaconda/X.log

if [[ ! -f "$f1" ]]
then
echo "File doesn't exist"
exit 0
fi

awk '{if ($3 == "(WW)") {$3 = "Warning"; print $0}}' "$f1" > full.log

awk '{if ($3 == "(II)") {$3 = "Information"; print $0}}' "$f1" >> full.log

cat full.log
