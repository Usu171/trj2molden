#!/bin/bash
# Modify from http://sobereva.com/258

# Your ORCA path
orca_path=/home/usu171/downloads/orca_5_0_4

icc=0
nfile=`ls ./*.inp|wc -l`
for inf in *.inp
do
((icc++))
echo Running ${inf} ... \($icc of $nfile\)
time $orca_path/orca ${inf} > ${inf/inp/out}
$orca_path/orca_2mkl ${inf/.inp} -molden
echo ${inf} has finished
echo
done
