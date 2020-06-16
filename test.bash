#!/bin/bash

# Written by: Tirtharaj Dash, Ph.D. Student, BITS Pilani, Goa Campus, India
# Date: During Jan-April 2019
# E-mail: tirtharaj@goa.bits-pilani.ac.in

# Purpose: bash script to test saved models from the work of graph classification methods on NCI data (73 problems). 
# Learning Type: Classification (Binary)

# Result storage mapping: [ Methods: GNN, VEGNN, VEGNN_HS | ID: 1 (networks1.py), 2 (networks2.py), 3 (networks3.py), 4 (networks4.py), 4_1 (networks4_1.py) ]


#path settings
prefixdir="/home/dell5810/tdash/DataForVEGNN/Datasets"
relfeatsdir="/home/dell5810/tdash/DataForVEGNN/ILPFeats"
trntstsplitdir="/home/dell5810/tdash/DataForVEGNN/TrainTestSplit"


#pass the path of the directory, where Results are stored.
resultdir="Result_GNN3_Czech"

#for each dataset in the list
for dataset in `cat datasets | head -1`
do
	echo "Working on: $dataset"

	rm ./data/DS/raw/*
	rm -rf ./data/DS/processed
	cp $prefixdir/$dataset/DS_*.txt ./data/DS/raw/.
	cat ./data/DS/raw/DS_node_attributes_bin.txt | cut -d, -f1-6 > ./data/DS/raw/DS_node_attributes.txt
	#cat ./data/DS/raw/DS_node_attributes_bin.txt > ./data/DS/raw/DS_node_attributes.txt
	
	cp $trntstsplitdir/$dataset/test_split ./data/DS/.
	cp $resultdir/$dataset/* .
	cat score.txt | gawk '{print $3}'

	#test & print the saved model
	#python modelsummary.py #this is already included in the evalsavedmodel.py
	python evalsavedmodel.py #to print the model summary here: uncomment the line "print(model)" in the evalsavedmodel.py script
done

