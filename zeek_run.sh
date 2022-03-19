#!/bin/bash

set -e

DIR=$(pwd)
FILE=$1

export ZEEK_LOG_SUFFIX=log
zeek -Cr $DIR/$FILE local LogAscii::use_json=F

export ZEEK_LOG_SUFFIX=json
zeek -Cr $DIR/$FILE local LogAscii::use_json=T

for FILE in *.json
do 
    jq . $FILE > $FILE.tmp
    mv $FILE.tmp $FILE
done



