#!/bin/bash
# Eesmärk: küsib täisarvu ja väljastab, kas arv on paaris või paaritu.

printf "Sisesta suvaline täisarv: "
read -r arv

# Kontrolli, et oleks täisarv (lubame ka miinusmärgi)
if ! [[ "$arv" =~ ^-?[0-9]+$ ]]; then
  echo "Viga: palun sisesta täisarv."
  exit 1
fi

# Tingimuslaused (arv%2==0 -> paaris, muidu paaritu)
if (( arv % 2 == 0 )); then
  echo "Antud arv on paaris"
else
  echo "Antud arv on paaritu"
fi
