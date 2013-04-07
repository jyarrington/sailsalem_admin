mysqldump -u sailsalem -pairodoodle -h mysql.getaclew.com ss_admin_data > backup.sql
sed '/^\/\*\!50013/d' backup.sql > backup_without_50013.sql
mysql -u sailsalem -pairodoodle -h mysql.getaclew.com -D ss_admin_data_dev < backup_without_50013.sql
