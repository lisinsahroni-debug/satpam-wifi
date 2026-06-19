#!/bin/bash
echo "=== MESIN CEK KEKUATAN PASSWORD ==="
while IFS= read -r pass
do
  panjang=${#pass}
  if [ $panjang -lt 8 ]; then
    echo "$pass -> LEMAH: Kurang dari 8 karakter"
  else
    echo "$pass -> AGAK KUAT: Panjangnya $panjang"
  fi
done < password.txt
