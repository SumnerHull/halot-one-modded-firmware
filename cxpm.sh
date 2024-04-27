#!/bin/sh
i=1
while [ $i -le 10000 ]
do
  info=${product}
  oldinfo=$(cat product.log)
  if [[ "$info" != "$oldinfo" ]]; then
    echo "info is ${info}" >> /tmp/startUI.log
    echo "oldinfo is ${oldinfo}" >> /tmp/startUI.log
    rm -rf /.cache
    echo "rm cache" >>/tmp/startUI.log
  fi
  echo "${info}" > product.log
  cd /usr/bin/PrinterUI
  ./PrinterUI
  sleep 2
  let i++
done
