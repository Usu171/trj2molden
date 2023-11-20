#!/bin/bash
xyzfilename=$1

number=$(awk '{print $1}' $xyzfilename | head -1)
rownumber=$(awk '{print NR}' $xyzfilename|tail -1)
xyznumber=$((rownumber / (number + 2)))
echo $rownumber
echo $xyznumber
truncate -s 0 ${xyzfilename%.*}_reverse.${xyzfilename##*.}
for ((i=$xyznumber; i >= 1; i=i-1))
do
    startline=$(((i - 1)*(number + 2)+1))
    endline=$((startline + number + 1))

    sed -n "${startline},${endline-1}p" $xyzfilename >> ${xyzfilename%.*}_reverse.${xyzfilename##*.}
done
