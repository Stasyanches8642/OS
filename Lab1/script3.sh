# Создать текстовое меню с четырьмя пунктами. При вводе пользователем номера пункта меню 
# происходит запуск редактора nano, редактора vi, браузера links или выход из меню.
#!/bin/bash

operations=("Run the nano" "Run the vi" "Run the Links" "Exit")

while true
do
echo "Choose the operation:"

select op in "${operations[@]}"
do

case "op" in

"Run the nano")
echo "You chose the 1st operation"
nano
break
;;

"Run the vi")
echo "You chose the 2nd operation"
vi
break
;;

"Run the Links")
echo "You chose the 3rd operation"
links
break
;;

"Exit")
echo "The menu will be closed"
exit 0
;;

*)
echo "Incorrect variant. Please, try again"
;;

esac

done

read -p "Push the ENTER to continue"

done
