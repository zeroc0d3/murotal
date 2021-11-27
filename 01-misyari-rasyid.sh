#!/bin/sh

PATH_MUROTAL="/home/zeroc0d3/Documents/murotal/Misyari_Rasyid"
DOWNLOAD_PATH="https://ia801204.us.archive.org/17/items/Misyari_Rasyid_per_Juz/"

mkdir -p $PATH_MUROTAL
cd $PATH_MUROTAL

counter=1

while [ $counter -le 30 ]
do
    if [ $counter -lt 10 ]
    then
      echo =============================
      echo " Download Juz: 0$counter "
      echo =============================
      echo " >> $DOWNLOAD_PATH/0$counter.mp3"
      wget $DOWNLOAD_PATH/0$counter.mp3
    else
      echo =============================
      echo " Download Juz: $counter "
      echo =============================
      echo " >> $DOWNLOAD_PATH/$counter.mp3"
      wget $DOWNLOAD_PATH/$counter.mp3
    fi
    ((counter++))
    echo ""
done

echo "-- ALL DONE --"
