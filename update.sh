#!/bin/bash

echo "yay"
MYDATE=`date -I`
FILEN="yyt_infos.json"

git pull

rm FILEN
yytcli getcards -r
cp `ls -tra | grep yyt | tail -1` FILEN
git add FILEN

git commit -m $MYDATE && echo "commit"
git push

echo "end"
