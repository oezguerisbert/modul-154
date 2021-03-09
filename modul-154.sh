docker run -d --name modul-154_2 -p 3307:3306 -e MYSQL_ALLOW_EMPTY_PASS
WORD=true mysql "apt update && apt upgrade -y && apt install git -y; mkdir mysql_files && cd mysql_files && git clone https://github.com/oezguerisbert/modul-154.git && cd modul-154 && mysql -u root --execute "create database employee" && mysql -u root employee < employee.sql"
