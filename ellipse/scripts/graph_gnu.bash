#!/bin/bash

cd /home/common/studtscm09/ellipse/data/changing_k


gnuplot -persist <<-EOFMarker
set terminal png size 800, 600
set output "energies.png"
set datafile separator ' '
set grid xtics ytics
set ylabel "Energy" 
set xlabel 'Step'
set title "Energies with different starting koef k" 
plot "energies_0.txt" using 1:2 with lines title "k 10", "energies_1.txt" using 1:2 with lines title "k 100", "energies_2.txt" using 1:2 with lines title "k 1000", "energies_3.txt" using 1:2 with lines title "k 10000",  "energies_4.txt" using 1:2 with lines title "k 100000"
EOFMarker

curl -s -X POST https://api.telegram.org/bot5188652668:AAG2TOUXEmCbCjcMF9KdQzsTxzjPXOsYXps/sendMessage -d chat_id=583118411 -d text="График построен!"
curl -s -X POST https://api.telegram.org/bot5188652668:AAG2TOUXEmCbCjcMF9KdQzsTxzjPXOsYXps/sendPhoto -F chat_id=583118411 -F photo="@energies.png" \ -F  caption="График для энергий:"
