#!/bin/bash
xyzfilename=$1

number=$(awk '{print $1}' $xyzfilename | head -1)
rownumber=$(awk '{print NR}' $xyzfilename|tail -1)
xyznumber=$((rownumber / (number + 2)))
echo $rownumber
echo $xyznumber

for ((i=1; i<=$xyznumber; i=i+1))
do
    startline=$(((i - 1)*(number + 2)+1))
    endline=$((startline + number + 1))
    sed -n "${startline},${endline-1}p" $xyzfilename > $i.xyz
done

