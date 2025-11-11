#!/bin/bash
# Eesmärk: küsib kasutajalt ees- ja perenime ning tervitab teda.

# -n = ilma reavahetuseta prompt
printf "Sisesta oma ees- ja perenimi: "
read -r tais_nimi

echo "Tere tulemast, $tais_nimi"
