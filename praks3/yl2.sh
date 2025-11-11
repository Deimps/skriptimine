#!/bin/bash
# Eesmärk: arvutada, mitu küpsisepakki on vaja tordi jaoks (täisarvuline arvutus expr-iga).

echo "— Küpsisetordi kalkulaator —"
printf "Aluskandiku pikkus (cm): " ; read -r kand_p
printf "Aluskandiku laius  (cm): " ; read -r kand_l
printf "Küpsise pikkus     (cm): " ; read -r kups_p
printf "Küpsise laius      (cm): " ; read -r kups_l
printf "Kihtide arv: " ; read -r kihid
printf "Küpsiseid ühes pakis: " ; read -r pakis

# Küpsiste arv ühes reas/veerus (põrandjagamine)
per_row=$(expr "$kand_p" / "$kups_p")
per_col=$(expr "$kand_l" / "$kups_l")

# Küpsised ühes kihis ja kokku
per_layer=$(expr "$per_row" \* "$per_col")
kokku=$(expr "$per_layer" \* "$kihid")

# Vajalik pakkide arv (lae ülespoole: (kokku + pakis - 1) / pakis)
pakke=$(expr \( "$kokku" + "$pakis" - 1 \) / "$pakis")

# Soovi korral arvuta ka üle jääk
ostetud_kups=$(expr "$pakke" \* "$pakis")
ule=$(expr "$ostetud_kups" - "$kokku")

echo
echo "Küpsiseid reas:        $per_row"
echo "Küpsiseid veerus:      $per_col"
echo "Küpsiseid ühes kihis:  $per_layer"
echo "Küpsiseid kokku:       $kokku"
echo "Pakke vaja:            $pakke"
echo "Üle jääb (pärast ostu): $ule"
