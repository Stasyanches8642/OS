#  Создать файл emails.lst, в который вывести через запятую все адреса электронной почты, встречающиеся во всех файлах директории /etc.
#!/bin/bash

pt="[[:alnum:].%+-]+@[[:alnum:].-]+\.[[:alpha:]]+"
touch tmp.sh answ.sh

find /etc -type f | while read -r f1
do
grep -hoIE "$pt" "$f1" >> tmp.sh
done

paste -sd "," tmp.sh > answ.sh

rm tmp.sh

cat answ.sh
