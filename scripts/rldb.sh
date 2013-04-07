#!/bin/bash

ssh -C getaclew@getaclew.com mysqldump --host db.getaclew.com -u sailsalem --password=airodoodle ss_admin_data | gzip > ss_admin_data.sql.gz

gunzip < ss_admin_data.sql.gz | mysql -u sailsalem -pairodoodle -D ss_admin_data
