docker run -d --name "modul-154_2" -p 3307:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql
docker exec -it "modul-154_2" /bin/bash -c "apt update && apt install git -y && git clone https://github.com/datacharmer/test_db.git && cd test_db && mysql -u root --execute 'create database employees; create database employee;' && mysql -u root employees < employees.sql && cd .. && git clone https://github.com/oezguerisbert/modul-154.git && cd modul-154 && mysqldump -u root employees > emp.sql && mysql -u root employee < emp.sql && mysql -u root employee < migration.sql"