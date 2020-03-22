set terminal pngcairo background rgb 'black' size 800,500 enhanced font 'Verdana,10'
set output 'kreise.png'

set xdata time
set key left
set timefmt "%Y-%m-%d"
set datafile separator "\t"
set decimalsign locale     
set format x "%Y-%m-%d"
set format y "%'.0f"  
set grid lc rgb 'white'
set border lc rgb 'white'
set key tc rgb 'white'
set title 'COVID-19 Positivmeldungen in Schleswig-Holstein' tc rgb 'white'

plot 'data.csv' using 1:2 with lines lc '#e6194b' title 'Dithmarschen', \
 '' using 1:3 with lines lc '#3cb44b' title 'Flensburg', \
 '' using 1:4 with lines lc '#ffe119' title 'Herzogtum Lauenburg', \
 '' using 1:5 with lines lc '#4363d8' title 'Kiel', \
 '' using 1:6 with lines lc '#f58231' title 'Lübeck', \
 '' using 1:7 with lines lc '#911eb4' title 'Neumünster', \
 '' using 1:8 with lines lc '#42d4f4' title 'Nordfriesland', \
 '' using 1:9 with lines lc '#f032e6' title 'Ostholstein', \
 '' using 1:10 with lines lc '#bfef45' lt 3 title 'Pinneberg', \
 '' using 1:11 with lines lc '#fababe' title 'Plön', \
 '' using 1:12 with lines lc '#469990' title 'Rendsburg-Eckernförde', \
 '' using 1:13 with lines lc '#e6beff' title 'Schleswig-Flensburg', \
 '' using 1:14 with lines lc '#9a6324' title 'Segeberg', \
 '' using 1:15 with lines lc '#fffac8' title 'Steinburg', \
 '' using 1:16 with lines lc '#800000' title 'Stormarn'

set output 'gesamt.png'
plot 'data.csv' using 1:17 with lines notitle
