#!/bin/bash

USER_NAME=sample_user

cat <<EOT | mysql -u root
create user $USER_NAME;
grant all privileges on *.* to $USER_NAME@"%";
grant all privileges on *.* to $USER_NAME@"localhost";
EOT

mysqladmin password $USER_NAME -u $USER_NAME
