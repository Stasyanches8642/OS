# Считывать строки с клавиатуры, пока не будет введена строка "q". После этого вывести 
# последовательность считанных строк в виде одной строки.
#!/bin/bash
str=""
answ=""
while [[ "$str" != "q" ]]
do
answ="$answ$str"
read str
done
echo "$answ"
