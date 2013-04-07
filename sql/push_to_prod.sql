mysqldump -u root -proot ss_admin_data > dev_dump.sql
sed '/^\/\*\!50013/d' dev_dump.sql > dev_dump_without_50013.sql
