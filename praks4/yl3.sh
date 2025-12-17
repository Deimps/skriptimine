#!/bin/bash
# Eesmärk: pesastatud if-näide (valiku kontroll).

osch=0
echo "1. Unix (Sun OS)"
echo "2. Linux (Red Hat)"
printf "Select your OS choice [1 or 2]? "
read -r osch

if [ "$osch" -eq 1 ]; then
  echo "You Pick up Unix (Sun OS)"
else
  if [ "$osch" -eq 2 ]; then
    echo "You Pick up Linux (Red Hat)"
  else
    echo "What—you don't like Unix/Linux OS."
  fi
fi
