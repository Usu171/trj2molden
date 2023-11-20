for inf in *.molden.input
do
Multiwfn ${inf} < batch.txt
mv func1.cub f1_${inf/.molden.input}.cub
mv func2.cub f2_${inf/.molden.input}.cub
done