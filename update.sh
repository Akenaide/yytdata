#!/bin/bash

echo "yay"
MYDATE=`date -I`
FILEN="yyt_infos.json"
PWD=`pwd`

git pull

rm $FILEN
docker run --rm --user "$(id -u):$(id -g)" -v $PWD:/data akenaide/yytcli:master getcards -r
cp `ls -tra | grep yyt | tail -1` $FILEN
git add $FILEN

git commit -m $MYDATE && echo "commit"
git push

echo "end"
