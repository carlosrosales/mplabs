reset
set term pdfcairo noenhanced color solid linewidth 3 font "Arial,10" size 6,4


# pt 1  - +
# pt 2  - x
# pt 3  - *
# pt 4  - open square
# pt 5  - filled square
# pt 6  - open circle
# pt 7  - filled circle
# pt 8  - open triangle
# pt 9  - filled triangle
# pt 10 - open inverted triangle
# pt 11 - filled inverted triangle
# pt 12 - open rhomboid
# pt 13 - filled rhomboid
# pt 14 - +
# pt 15 - x
# pt 16 - *
# pt 17 - open square
# pt 18 - filled square
# pt 19 - open circle
# pt 20 - filled circle

# lc rgb "#0066CC" - blue
# lc rgb "#66CC00" - green
# lc rgb "#CC6600" - orange
# lc rgb "#CC0000" - red
# lc rgb "#CC00CC" - dark red
# lc rgb "#00CC66" - bright green
# lc rgb "#66CCCC" - light blue



set style line 1 lc rgb "#0066CC" lw 2 pt 9 ps 1.2
set style line 2 lc rgb "#66CC66" lw 2 pt 6  ps 1.2
set style line 3 lc rgb "#CC0022" lw 2 pt 2 ps 1.2

#set style line 3 lc rgb "#CC0022" lw 2 pt 7 ps 1.2
#set style line 4 lc rgb "#CC0000" pt 5  ps 1.5
#set style line 5 lc rgb "#00CC66" pt 8  ps 1.5

set output "scaling_mic.pdf"
set grid
set title "LBS3D 240x240x240"
set xlabel "Number of OMP Threads"
set ylabel "MLUPS"
set key bottom right
plot 'scaling_mic.dat' u 1:2 title "Intel Xeon Phi SE10P @ 1.1GHz" with lp ls 1

set output "scaling_cpu.pdf"
set grid
set title "LBS3D 240x240x240"
set xlabel "Number of OMP Threads"
set ylabel "MLUPS"
set key bottom right
plot 'scaling_cpu.dat' u 1:2 title "Intel Xeon E5-2680 @ 2.70GHz" with lp ls 2, '' u 1:3 title "Intel Xeon X5680 @ 3.33GHz" w lp ls 3

set output "scaling_mpi.pdf"
set grid
set logscale x
set logscale y
set title "ZSC-3D-MPI 240x480x480"
set xlabel "Number of MPI Tasks"
set ylabel "MLUPS"
set key bottom right
plot 'scaling_mpi.dat' u 1:2 title "Measured" with lp ls 2, '' u 1:($1*2.9) title "Ideal" w lines ls 3

set output "scaling_hybrid.pdf"
set grid
set logscale x
set logscale y
set title "LBS3D-MPI 240x480x480"
set xlabel "Number of MPI Tasks"
set ylabel "MLUPS"
set key bottom right
plot 'scaling_hybrid_cpu.dat' u 1:2 title "Measured" with lp ls 2, '' u 1:($1*3.3) title "Ideal" w lines ls 3

# E5-2680 @ 2.7GHz
# X5680  @ 3.33GHz


