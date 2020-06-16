#createressum: Create Result Summary in a File for Each Method
#takes one argument: a string from the set {1, 2, 3, 4, 5}

#!/bin/bash

if [ $# -eq 0 ]
then
	echo "No argument is passed. see help with: bash $0 --help"
	exit 1
fi

if [ "$1" == "--help" ]
then
	echo "Help: one argument for network variant choice {1, 2, 3, 4, 5}"
	echo "Example: bash $0 1"
	exit 1
fi

#source directory names:
gnnres="Result_GNN$1_Czech"
vegnnres="Result_VEGNN$1_Czech"
vegnnhs100res="Result_VEGNN$1_HS100_Czech"
vegnnhs500res="Result_VEGNN$1_HS500_Czech"
vegnnhs1000res="Result_VEGNN$1_HS1000_Czech"


#Result summary file:
resfile="./Results/ressum$1.csv"

#start writing out to the file
echo -e "DATASET,GNN,VEGNN,VEGNNHS100,VEGNNHS500,VEGNNHS1000" > $resfile
for dataset in `cat datasets`
do
	a=`cat $gnnres/$dataset/score.txt | gawk '{print $3}'`
	b=`cat $vegnnres/$dataset/score.txt | gawk '{print $3}'`
	c=`cat $vegnnhs100res/$dataset/score.txt | gawk '{print $3}'`
	d=`cat $vegnnhs500res/$dataset/score.txt | gawk '{print $3}'`
	e=`cat $vegnnhs1000res/$dataset/score.txt | gawk '{print $3}'`
	echo -e "$dataset,$a,$b,$c,$d,$e" >> $resfile
done

sed -i 's/gi50_screen_//g' $resfile 

