# В полученном на предыдущем шаге файле после каждой группы записей с одинаковым идентификатором родительского процесса вставить строку вида 
# Average_Running_Children_of_ParentID=N is M, где N = PPID, а M – среднее, посчитанное из ART для всех процессов этого родителя.
#!/bin/bash

touch answer5.txt
chmod +x answer5.txt
answ="/home/user/lab2/answer4.txt"
>answer5.txt

curr_ppid=0
cnt=0
amount=0
curr_art=0
M=0

length=$(wc -l < "$answ")

for ((i=1; i<="$lensth"; i++))
do
line=$(sed -n "${i}p" "$answ")
ppid=$(echo "$line" | awk '{print $3}' | grep -Eo '[0-9]+')
curr_art=$(echo "$line" | awk '{print $5}' | grep -Eo '([1-9][0-9]*\.[0-9]+|\.[0-9]+)|[0-9]+')

if [ "$ppid" != "$curr_ppid" ] && [ "$cnt" -ne 0 ]
then
M=$(echo "scale=4; $amount / $cnt" | bc)
echo "Average_Running_Children_of_ParentID=$curr_ppid is $M" >> answer5.txt
curr_ppid="$ppid"
amount=0
cnt=0
fi

((cnt++))
amount=$(echo "scale=4; $amount + $curr_art" | bc)
echo "$line" >> answer5.txt

done

if [[ "$cnt" -ne 0 ]]
then
M=$(echo "scale=4; $amount / $cnt" | bc)
echo "Average_Running_Children_of_ParentID=$curr_ppid is $M" >> answer5.txt
fi
