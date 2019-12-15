if [ $# -eq 1 ]
then
  echo "1 arg"
  if [ $1 == 12 ]
  then
    echo "12!"
  fi
else
  echo "Not 1"
fi
