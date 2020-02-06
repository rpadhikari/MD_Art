#!/bin/bash
m=50
mlim=110
rm devs
while [ "$m" -le "$mlim" ]
do
let density=m
res=`echo "$density*0.01" | bc -l`
echo "$res" > density.dat
./md.x
let m=$m+1
done



