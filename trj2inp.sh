#!/bin/bash
xyzfilename=$1
inp=$2

number=$(awk '{print $1}' $xyzfilename | head -1)
rownumber=$(awk '{print NR}' $xyzfilename|tail -1)
xyznumber=$((rownumber / (number + 2)))
echo $rownumber
echo $xyznumber

for ((i=1; i<=$xyznumber; i=i+1))
do
    startline=$(((i - 1)*(number + 2)+3))
    endline=$((startline + number - 1))
    sed -n "${startline},${endline-1}p" $xyzfilename > temp.txt

    new_startline=$(grep -n -i '\[geometry\]' $inp | awk -F : '{print $1}')



    sed "${new_startline}r temp.txt" $inp > $i.inp
    sed -i "/\[geometry\]/I d" $i.inp
done

rm temp.txt
