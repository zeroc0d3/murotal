#!/bin/sh

set -e

TITLE="MUROTAL DOWNLOADER SCRIPT"    # script name
VER="2.2"                            # script version

ID_CODE=$1
PATH_MUROTAL=$2

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

selected_download() {
  case $ID_CODE in
    10 | 1000)
      export PATH_MUROTAL="$PATH_MUROTAL/1000_Misyari_Rasyid"
      export DOWNLOAD_PATH="https://ia801204.us.archive.org/17/items/Misyari_Rasyid_per_Juz"
      ;;

    12 | 1200)
      export PATH_MUROTAL="$PATH_MUROTAL/1200_Saad_AlGhamidi"
      export DOWNLOAD_PATH="https://ia903200.us.archive.org/20/items/SaadAl-GhamidiPerJuz"
      ;;

    14 | 1400)
      export PATH_MUROTAL="$PATH_MUROTAL/1400_Abdurrahman_AsSudais"
      export DOWNLOAD_PATH="https://ia801904.us.archive.org/14/items/AbdurrahmanSudaisPerJuz"
      ;;

    16 | 1600)
      export PATH_MUROTAL="$PATH_MUROTAL/1600_Hany_ArRifai"
      export DOWNLOAD_PATH="https://ia801207.us.archive.org/10/items/HanyAr-RifaiPerJuz"
      ;;

    18 | 1800)
      export PATH_MUROTAL="$PATH_MUROTAL/1800_Yasser_AlDosari"
      export DOWNLOAD_PATH="https://ia803203.us.archive.org/26/items/YasserAlDosariPerJuz"
      ;;

    20 | 2000)
      export PATH_MUROTAL="$PATH_MUROTAL/2000_Saud_AlShuraim"
      export DOWNLOAD_PATH="https://ia903208.us.archive.org/20/items/SaudAlShuraimPerJuz"
      ;;

    22 | 2200)
      export PATH_MUROTAL="$PATH_MUROTAL/2200_Nasser_AlQatami"
      export DOWNLOAD_PATH="https://ia800400.us.archive.org/23/items/Nasseralqatamieveryjuz"
      ;;

    24 | 2400)
      export PATH_MUROTAL="$PATH_MUROTAL/2400_Abdul_Basit_AbdulSamad"
      export DOWNLOAD_PATH="https://ia903200.us.archive.org/23/items/AbdulBasitAbdulsamadPerJuz"
      ;;

    *)
      echo ""
      echo ">> Unknown MID (Murotal ID)"
      echo ">> Set to default MID: 10"
      export PATH_MUROTAL="$PATH_MUROTAL/1000_Misyari_Rasyid"
      export DOWNLOAD_PATH="https://ia801204.us.archive.org/17/items/Misyari_Rasyid_per_Juz"
      echo ""
      ;;
  esac
  download_murotal_perjuz
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
  selected_download $1 $2
  footer
}

### START HERE ###
main $1 $2
