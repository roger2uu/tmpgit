# gnuplot <xxx.gnuplot>

set output 'histogram.png'
datafile='latency.dat'

set terminal png nocrop enhanced size 450,200 font "arial,8" 
set zeroaxis
set style data points
set key top right
set style fill solid
set title "Statistics Histogram"
set time

stats datafile using 1 name "A" 				# REF[1]
n=20 # the number of bins
width=(A_max-A_min)/n
bin(x,width)=width*floor(x/width)+width/2.0	# REF[2]
set boxwidth width*0.9
set xlabel sprintf("min=%.3f  max=%.3f  mean=%.3f",A_min,A_max,A_mean) # REF[3]

plot datafile using (bin($1,width)):(1.0) smooth freq with boxes lc rgb"green" notitle
unset output

# REFERENCE: 
# [1] gnuplot> help stats
# [2] http://stackoverflow.com/questions/2471884/histogram-using-gnuplot
# [3] http://blog.sina.com.cn/s/blog_74cbb8e801019qrp.html


