#!/bin/bash 
# Filename: plot_phase_diagram.sh
# This program plots a ternary diagram.
#
#
# Based on the following examples:
#    Drawing ternary diagrams https://staff.aist.go.jp/a.noda/programs/ternary/ternary-en.html
#    Plotting ternary diagram https://groups.google.com/forum/#!topic/comp.graphics.apps.gnuplot/5KdRX3SXqVs
#
#
#
# ternary plot
# it is expected that the 3 components add up to 100%, thus only the
# first 2 columns are actually used, the third is implied

exp_file="phase_diagram.dat"
output_file="phase_diagram.png"
_1='$1' 
_2='$2' 

gnuplot <<__EOF
###
# FORMATTING taken from http://labs.guidolin.net/2010/03/how-to-create-beautiful-gnuplot-graphs.html
###
reset
set macro

#####  Color Palette by Color Scheme Designer
#####  Palette URL: http://colorschemedesigner.com/#3K40zsOsOK-K-

   blue_000 = "#A9BDE6" # = rgb(169,189,230)
   blue_025 = "#7297E6" # = rgb(114,151,230)
   blue_050 = "#1D4599" # = rgb(29,69,153)
   blue_075 = "#2F3F60" # = rgb(47,63,96)
   blue_100 = "#031A49" # = rgb(3,26,73)

   green_000 = "#A6EBB5" # = rgb(166,235,181)
   green_025 = "#67EB84" # = rgb(103,235,132)
   green_050 = "#11AD34" # = rgb(17,173,52)
   green_075 = "#2F6C3D" # = rgb(47,108,61)
   green_100 = "#025214" # = rgb(2,82,20)

   red_000 = "#F9B7B0" # = rgb(249,183,176)
   red_025 = "#F97A6D" # = rgb(249,122,109)
   red_050 = "#E62B17" # = rgb(230,43,23)
   red_075 = "#8F463F" # = rgb(143,70,63)
   red_100 = "#6D0D03" # = rgb(109,13,3)

   brown_000 = "#F9E0B0" # = rgb(249,224,176)
   brown_025 = "#F9C96D" # = rgb(249,201,109)
   brown_050 = "#E69F17" # = rgb(230,159,23)
   brown_075 = "#8F743F" # = rgb(143,116,63)
   brown_100 = "#6D4903" # = rgb(109,73,3)

   grid_color = "#d5e0c9"
   text_color = "#6a6a6a"

   this_font = "SVBasic Manual, 12"
   this_font_file = "~/local/share/fonts/defaults/LiberationMono-Regular.ttf"
   this_export_sz = "1024,1024"

   this_line_width = "2"
   this_axis_width = "1.5"
   this_ps = "1.2"
   this_font_size = "14"


set style data linespoints
set style function lines
set pointsize this_ps

set linestyle 3 lt 3 lw 1 pt 1 ps 1
set linestyle 1 lt 1 lw 1 pt 1 ps 1
#set linestyle 2 lt rgb '#5e9c36' lw 1 pt -1 ps 1
set linestyle 2 lt rgb green_075 lw 1 pt 1 ps 1

#set style line 1  linecolor rgbcolor red_025   linewidth @this_line_width pt 7
#set style line 2  linecolor rgbcolor green_025  linewidth @this_line_width pt 5
#set style line 3  linecolor rgbcolor blue_025 linewidth @this_line_width pt 9
set style line 4  linecolor rgbcolor brown_025 linewidth @this_line_width pt 13
set style line 5  linecolor rgbcolor blue_050  linewidth @this_line_width pt 11
set style line 6  linecolor rgbcolor green_050 linewidth @this_line_width pt 7
set style line 7  linecolor rgbcolor red_050   linewidth @this_line_width pt 5
set style line 8  linecolor rgbcolor brown_050 linewidth @this_line_width pt 9
set style line 9  linecolor rgbcolor blue_075  linewidth @this_line_width pt 13
set style line 10 linecolor rgbcolor green_075 linewidth @this_line_width pt 11
set style line 11 linecolor rgbcolor red_075   linewidth @this_line_width pt 7
set style line 12 linecolor rgbcolor brown_075 linewidth @this_line_width pt 5
set style line 13 linecolor rgbcolor blue_100  linewidth @this_line_width pt 9
set style line 14 linecolor rgbcolor green_100 linewidth @this_line_width pt 13
set style line 15 linecolor rgbcolor red_100   linewidth @this_line_width pt 11
set style line 16 linecolor rgbcolor brown_100 linewidth @this_line_width pt 7
set style line 17 linecolor rgbcolor "#224499" linewidth @this_line_width pt 5

###
# END FORMATING
###

set size square
set angle degrees
set noborder
set xrange [-10:100]
set yrange [-10:100]
set noxtics
set noytics
#set key 100,90

# plot triangular coordinate system, using different
# colours for each axis

set linestyle 3 lt 3 lw 1 pt -1 ps 1
set linestyle 1 lt 1 lw 1 pt -1 ps 1
set linestyle 2 lt rgb '#14a83b' lw 1 pt -1 ps 1

# x-axis
set arrow  1 from  0,0 to 100.0,  0.0 nohead linestyle 3
set arrow  2 from 10,0 to  55.0, 77.9 nohead linestyle 3
set arrow  3 from 20,0 to  60.0, 69.3 nohead linestyle 3
set arrow  4 from 30,0 to  65.0, 60.6 nohead linestyle 3
set arrow  5 from 40,0 to  70.0, 52.0 nohead linestyle 3
set arrow  6 from 50,0 to  75.0, 43.3 nohead linestyle 3
set arrow  7 from 60,0 to  80.0, 34.6 nohead linestyle 3
set arrow  8 from 70,0 to  85.0, 26.0 nohead linestyle 3
set arrow  9 from 80,0 to  90.0, 17.3 nohead linestyle 3
set arrow 10 from 90,0 to  95.0,  8.7 nohead linestyle 3
set label  1  "0" at  0,-5 center tc lt 3
set label  2 "10" at 10,-5 center tc lt 3
set label  3 "20" at 20,-5 center tc lt 3
set label  4 "30" at 30,-5 center tc lt 3
set label  5 "40" at 40,-5 center tc lt 3
set label  6 "50" at 50,-5 center tc lt 3
set label  7 "60" at 60,-5 center tc lt 3
set label  8 "70" at 70,-5 center tc lt 3
set label  9 "80" at 80,-5 center tc lt 3
set label 10 "90" at 90,-5 center tc lt 3

# y-axis
set arrow 11 from 100,  0.0 to  50.0, 86.6 nohead linestyle 1
set arrow 12 from  95,  8.7 to   5.0,  8.7 nohead linestyle 1
set arrow 13 from  90, 17.3 to  10.0, 17.3 nohead linestyle 1
set arrow 14 from  85, 26.0 to  15.0, 26.0 nohead linestyle 1
set arrow 15 from  80, 34.6 to  20.0, 34.6 nohead linestyle 1
set arrow 16 from  75, 43.3 to  25.0, 43.3 nohead linestyle 1
set arrow 17 from  70, 52.0 to  30.0, 52.0 nohead linestyle 1
set arrow 18 from  65, 60.6 to  35.0, 60.6 nohead linestyle 1
set arrow 19 from  60, 69.3 to  40.0, 69.3 nohead linestyle 1
set arrow 20 from  55, 77.9 to  45.0, 77.9 nohead linestyle 1
set label 11 "  0" at 100,  0.0 left tc lt 1
set label 12 " 10" at  95,  8.7 left tc lt 1
set label 13 " 20" at  90, 17.3 left tc lt 1
set label 14 " 30" at  85, 26.0 left tc lt 1
set label 15 " 40" at  80, 34.6 left tc lt 1
set label 16 " 50" at  75, 43.3 left tc lt 1
set label 17 " 60" at  70, 52.0 left tc lt 1
set label 18 " 70" at  65, 60.6 left tc lt 1
set label 19 " 80" at  60, 69.3 left tc lt 1
set label 30 " 90" at  55, 77.9 left tc lt 1

# z-axis
set arrow 21 from  50,   86.6  to  0,0 nohead linestyle 2
set arrow 22 from   5.0,  8.7  to 10,0 nohead linestyle 2
set arrow 23 from  10.0, 17.3  to 20,0 nohead linestyle 2
set arrow 24 from  15.0, 26.0  to 30,0 nohead linestyle 2
set arrow 25 from  20.0, 34.6  to 40,0 nohead linestyle 2
set arrow 26 from  25.0, 43.3  to 50,0 nohead linestyle 2
set arrow 27 from  30.0, 52.0  to 60,0 nohead linestyle 2
set arrow 28 from  35.0, 60.6  to 70,0 nohead linestyle 2
set arrow 29 from  40.0, 69.3  to 80,0 nohead linestyle 2
set arrow 20 from  45.0, 77.9  to 90,0 nohead linestyle 2
set label 31 " 0 " at  50,   86.6 right tc rgb green_075
set label 32 "90 " at   5.0,  8.7 right tc rgb green_075
set label 33 "80 " at  10.0, 17.3 right tc rgb green_075
set label 34 "70 " at  15.0, 26.0 right tc rgb green_075
set label 35 "60 " at  20.0, 34.6 right tc rgb green_075
set label 36 "50 " at  25.0, 43.3 right tc rgb green_075
set label 37 "40 " at  30.0, 52.0 right tc rgb green_075
set label 38 "30 " at  35.0, 60.6 right tc rgb green_075
set label 39 "20 " at  40.0, 69.3 right tc rgb green_075
set label 40 "10 " at  45.0, 77.9 right tc rgb green_075

gx(x,y) = x + y * cos(60)
gy(x,y) = y * cos(30)

# Plot actual data
# From here on change according to need

   this_font = "SVBasic Manual, 18"
set label 41 "Water (%)" at 50,-10 center  tc lt 3      # label x-Axis
set label 42 "Acetic Acid (%)" at 90,50 center rotate by -60 tc lt 1# label y-Axis
set label 43 "Ethyl Acetate (%)" at 10,50 center rotate by 60 tc rgb '#14a83b'   # label z-Axis

set output "${output_file}

plot "${exp_file}" using (gx(${_1},${_2})):(gy(${_1},${_2})) notitle with points lt 7 lc 7 pt 6, "${exp_file}" using (gx(${_1},${_2})):(gy(${_1},${_2})):(0.1) smooth acsplines notitle with lines  lt 2 lc 7

set term pngcairo dashed size @this_export_sz font this_font
set output "${output_file}
replot
__EOF
#done