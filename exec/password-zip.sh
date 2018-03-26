#!/bin/bash

read -p 'zip target path: ' target
workdir=`dirname $target`
filename=`basename $target`
zipfile=${filename%.*}.zip
password=`pwgen -sy 16 1`
pushd $workdir > /dev/null
zip -e --password=$password $zipfile $filename > /dev/null
printf "password : \e[31m$password\e[m\n"
printf $password | pbcopy
echo 'above password is copied.'
popd > /dev/null
