# Вывести три наиболее часто встречающихся слова из man по команде bash длиной не менее четырех символов.
#!/bin/bash

man bash | tr '[:upper:]' '[:lower:]' | grep -oE '[[:alnum:]]{4,}' | sort |
uniq -c | sort -nr | head -n 3
