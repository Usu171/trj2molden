#!/bin/bash
# Modify from http://sobereva.com/258

xtb_args="--gfn 2 --chrg 0 --uhf 0  --molden"

icc=0
nfile=`ls ./*.xyz|wc -l`
for inf in *.xyz
do
((icc++))
echo Running ${inf} ... \($icc of $nfile\)
time xtb ${inf} ${xtb_args} > ${inf/xyz/out}
mv molden.input ${inf/xyz}molden.input
echo ${inf} has finished
echo
done

rm charges wbo xtbrestart xtbtopo.mol
