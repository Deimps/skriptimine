#!/bin/bash
# Eesmärk: väljastab tervituse praegusele kasutajale kujul: Tere, Kasutajanimi !
# Märkus: kasutajanimi võetakse süsteemist (id -un)

# 1) Väljasta "Tere, " ilma reavahetuseta
printf "Tere, "

# 2) Tekita muutuja kasutajanimega ja väljasta see ilma reavahetuseta
KASUTAJA="$(id -un)"
printf "%s" "${KASUTAJA}"

# 3) Väljasta "!" ja tee reavahetus
echo "!"
