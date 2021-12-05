#!/bin/sh

PATH_MUROTAL="/home/zeroc0d3/Documents/murotal/1200_Saad_AlGhamidi"
DOWNLOAD_PATH="https://ia903200.us.archive.org/20/items/SaadAl-GhamidiPerJuz"
ID_CODE="12"

COL_RED="\033[22;31m"
COL_GREEN="\033[22;32m"
COL_BLUE="\033[22;34m"
COL_END="\033[0m"

get_time() {
  DATE=`date '+%Y-%m-%d %H:%M:%S'`
}

print_line0() {
  echo "$COL_GREEN=====================================================================================$COL_END"
}

print_line1() {
  echo "$COL_GREEN-------------------------------------------------------------------------------------$COL_END"
}

print_line2() {
  echo "-------------------------------------------------------------------------------------"
}

logo() {
  clear
  print_line0
  echo "$COL_RED'########:'########:'########:::'#######:::'######::::'#####:::'########:::'#######:: $COL_END"
  echo "$COL_RED..... ##:: ##.....:: ##.... ##:'##.... ##:'##... ##::'##.. ##:: ##.... ##:'##.... ##: $COL_END"
  echo "$COL_RED:::: ##::: ##::::::: ##:::: ##: ##:::: ##: ##:::..::'##:::: ##: ##:::: ##:..::::: ##: $COL_END"
  echo "$COL_RED::: ##:::: ######::: ########:: ##:::: ##: ##::::::: ##:::: ##: ##:::: ##::'#######:: $COL_END"
  echo "$COL_RED:: ##::::: ##...:::: ##.. ##::: ##:::: ##: ##::::::: ##:::: ##: ##:::: ##::...... ##: $COL_END"
  echo "$COL_RED: ##:::::: ##::::::: ##::. ##:: ##:::: ##: ##::: ##:. ##:: ##:: ##:::: ##:'##:::: ##: $COL_END"
  echo "$COL_RED ########: ########: ##:::. ##:. #######::. ######:::. #####::: ########::. #######:: $COL_END"
  echo "$COL_RED........::........::..:::::..:::.......::::......:::::.....::::........::::.......::: $COL_END"
  print_line1
  echo "$COL_GREEN# $TITLE :: ver-$VER $COL_END"
}

header() {
  logo
  print_line0
  get_time
  echo "$COL_RED# BEGIN PROCESS..... (Please Wait)  $COL_END"
  echo "$COL_RED# Start at: $DATE  $COL_END"
}

footer() {
  print_line0
  get_time
  echo "$COL_RED# Finish at: $DATE  $COL_END"
  echo "$COL_RED# END PROCESS.....  $COL_END\n"
}

download_murotal_perjuz() {
  mkdir -p $PATH_MUROTAL
  cd $PATH_MUROTAL

  counter=1

  while [ $counter -le 30 ]
  do
      if [ $counter -lt 10 ]
      then
        download_below10 $counter
      else
        download_upper10 $counter
      fi
      ((counter++))
  done
}

download_below10() {
  JUZ="0$1"
  DOWNLOAD_LINK="$DOWNLOAD_PATH/$JUZ.mp3"
  FNAME="$PATH_MUROTAL/$ID_CODE$JUZ.mp3"
  msg_download $JUZ $DOWNLOAD_LINK
  skip_exists $FNAME $DOWNLOAD_LINK
  echo "- DONE - "
  echo ""
}

download_upper10() {
  JUZ="$1"
  DOWNLOAD_LINK="$DOWNLOAD_PATH/$JUZ.mp3"
  FNAME="$PATH_MUROTAL/$ID_CODE$JUZ.mp3"
  msg_download $JUZ $DOWNLOAD_LINK
  skip_exists $FNAME $DOWNLOAD_LINK
  echo "- DONE - "
  echo ""
}

msg_download() {
  print_line2
  get_time
  echo "$COL_BLUE[ $DATE ] ##### Download Juz: $1 "
  echo "$COL_GREEN[ $DATE ]       wget $2 $COL_END"
  get_time
  print_line2
}

skip_exists() {
  if [[ -f "$1" ]]
  then
    echo ">> Skip for existing file $1 ..."
  else
    # echo "wget -O $1 $2"
    wget -O $1 $2
  fi
}

main() {
  header
  download_murotal_perjuz
  footer
}

### START HERE ###
main $@
