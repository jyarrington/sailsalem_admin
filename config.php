<?php /**/ ?><?php

//production
$path = '/home/getaclew/admin.sailsalem.org/includes';

//dev
$path = '/Users/jyarrington/dev/sailsalemadmin/includes';

#$path = '/home/getaclew/admindev.sailsalem.org/includes';
#$path = '/Applications/MAMP/htdocs/sailsalem.org/admin/includes';
set_include_path(get_include_path() . PATH_SEPARATOR . $path);

$DEBUG = 1;

?>
