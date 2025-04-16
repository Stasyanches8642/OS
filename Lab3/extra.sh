# Написать скрипт, который при запуске предлагает выбрать логин и добавляет в общий чат на произвольное количество участников. После добавления в чат и до выхода из него командой QUIT, 
# пользователю приходят все сообщения от других участников чата. Любая строка, которую он вводит, отправляется в чат (кроме QUIT). После завершения скрипта, логин освобождается.

# Предварительно в директории этой лабораторной я создала файл chat.txt и поменяла для него уровень доступа.
#!/bin/bash

chat="/home/user/lab3/chat.txt"
curr_pid=$$

echo "Enter your login:"
read login

echo "User $login join the chat!" >> "$chat"

reading() 
{
tail -n 0 -f "$chat" --pid "$curr_pid" | while read -r line
do
if [[ ! "$line" =~ "$login" ]]
then
echo "$line"
fi
done &
}

reading

while true
do
read -r sms
if [[ "$sms" == "QUIT" ]]
then
echo "User $login left the chat!" >> "$chat"
exit 0
fi
echo "$login:$sms" >> "$chat"
done
