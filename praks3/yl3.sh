#!/bin/bash
# Eesmärk: aidata planeerida busse (täisarvuline jagamine expr-iga).

printf "Reisijate arv: " ; read -r reisijad
printf "Kohti ühes bussis: " ; read -r kohad

tais_busid=$(expr "$reisijad" / "$kohad")   # mitu täis bussi
ule=$(expr "$reisijad" % "$kohad")          # ülejäävad inimesed

# Lisainfo: kui tahaks teada, mitu bussi kokku vaja (ka poolik):
# bussid_kokku = (reisijad + kohad - 1) / kohad
bussid_kokku=$(expr \( "$reisijad" + "$kohad" - 1 \) / "$kohad")

echo "Täielikult täidetud busse: $tais_busid"
echo "Inimesi jääb üle:          $ule"
echo "Busse kokku vaja:          $bussid_kokku"
