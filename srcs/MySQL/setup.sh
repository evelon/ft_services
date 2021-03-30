#!/bin/sh
rc-update add mariadb default
rc-status default
rc-service mariadb start
mariadb -u root --skip-password < /tmp/create_tables.sql
mariadb