#!/bin/bash

# transfer Chinese character to pinyin
# time: 2013/9/13
# by: YN

# myhz2py is from the web: http://linux.chinaunix.net/techdoc/desktop/2008/07/06/1015213.shtml

while getopts c:f: opt
do
  case $opt in
    "c") ch=$OPTARG;;
    "f") inputFile=$OPTARG;;
    *) echo "bad command"
       exit 1
       ;;
  esac
done

h2p()
{
  if [ -z "$1" ]; then
    echo "require Chinese characters"
    exit 1
  fi

  ch=`echo $1 | sed s/"\s*"//g`
  py=`./myhz2py $ch`
  if [ -z "$py" ]; then
    echo "transform failed"
    exit 1
  fi
  py=`echo "$py" | sed s/[0-9]/\ /g`  #replace the digital
  firstname=`echo ${py%% *}`      #get the first name 
  rest=`echo ${py#* } | sed s/^[\ ]*//g | sed s/[\ ]*$//g`   #get the rest of the name, and delete the leading and tail whitespace
  upper=`echo ${firstname:0:1} | tr "[a-z]" "[A-Z]"`
  firstname=`echo $firstname | sed s/^[a-z]/"$upper"/g`   #upper the first letter
  upper=`echo ${rest:0:1} | tr "[a-z]" "[A-Z]"`
  rest=`echo $rest | sed s/^[a-z]/"$upper"/g | sed s/[\ ]*//g`   #upper the first letter
  #echo $firstname
  #echo $rest
  ENname="$rest $firstname"
  echo $ENname
}

if [ -n "$ch" ]; then
  echo "-c value is $ch"
  h2p "$ch"
elif [ -n "$inputFile" ]; then
  echo "inputFile is $inputFile"
  while read line
  do
    h2p "$line" >> ENname
  done < $inputFile
else
  echo "require -c or -f"
fi
