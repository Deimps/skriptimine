#!/bin/bash
# Eesmärk: arvuta busside arv – kui tekib ülejääk, suurenda busside arvu ühe võrra.

printf "Sisesta reisijate arv: "
read -r reisijad
printf "Sisesta kohtade arv bussis: "
read -r kohad

# Sisendikontroll: mitte-negatiivne täisarv reisijad; kohad > 0
if ! [[ "$reisijad" =~ ^[0-9]+$ ]]; then
  echo "Viga: reisijate arv peab olema täisarv (>=0)."; exit 1
fi
if ! [[ "$kohad" =~ ^[1-9][0-9]*$ ]]; then
  echo "Viga: kohtade arv peab olema täisarv (>0)."; exit 1
fi

tais=$(( reisijad / kohad ))
yle=$(( reisijad % kohad ))

if [ "$yle" -gt 0 ]; then
  kokku=$(( tais + 1 ))
else
  kokku=$tais
fi

echo "Kokku on vaja $kokku bussi"
