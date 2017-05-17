#! /usr/bin/sh

# @Author: Antoine Pointeau <kalif>
# @Date:   2017-05-17T23:44:43+02:00
# @Email:  web.pointeau@gmail.com
# @Filename: update-system.sh
# @Last modified by:   kalif
# @Last modified time: 2017-05-17T23:55:28+02:00

# This script expect the package manager as first param ($1)
mkdir /var/log/system-refresh 2> /dev/null

FILE_UPDATE=/var/log/system-refresh/update.log
date >> $FILE_UPDATE
$1 update -y >> $FILE_UPDATE 2>&1

FILE_UPGRADE=/var/log/system-refresh/upgrade.log
date >> $FILE_UPGRADE
$1 upgrade -y >> $FILE_UPGRADE 2>&1
