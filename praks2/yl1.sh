#!/bin/bash
# Eesmärk: väljastab tervituse praegusele kasutajale kujul: Tere, Nimi !
# Kus Nimi = kasutajatunnus, mille 1. täht on suur ja ülejäänud väikesed.

# 1) "Tere, " ilma reavahetuseta
printf "Tere, "

# 2) Võta kasutajanimi ja vorminda: esimene suur, ülejäänud väikesed
RAW="$(id -un)"
LOW="${RAW,,}"      # kõik väiketähtedeks (bash laiendus)
NIMI="${LOW^}"      # esimene täht suureks

# 3) Väljasta nimi ilma reavahetuseta
printf "%s" "${NIMI}"

# 4) "!" ja reavahetus
echo "!"
