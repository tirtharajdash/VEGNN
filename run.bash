#!/bin/bash

# Version: 2

# Written by: Tirtharaj Dash, Ph.D. Student, BITS Pilani, Goa Campus, India
# Date: During December 2019
# E-mail: tirtharaj@goa.bits-pilani.ac.in

# Work: GNN, Vertex-Enriched GNN (VEGNN), VEGNN_HS (VEGNN')
# What are these?
	# GNN: Graph Neural Network (simple graph strutured data): Nodes contain only atom features
	# VEGNN: GNN with Relational Features at Nodes
	# VEGNN_HS (VEGNN'): GNN with Relational Features and ILP Features at Nodes 
# Purpose: bash script to run graph classification methods on NCI data (73 problems). 
# Learning Type: Classification (Binary)

# Result storage mapping: [ Methods: GNN, VEGNN, VEGNN_HS | ID: 1 (networks1.py), 2 (networks2.py), 3 (networks3.py), 4 (networks4.py), 5 (networks5.py) ]


#path settings
prefixdir="/home/dell5810/tdash/DataForVEGNN/Datasets"
relfeatsdir="/home/dell5810/tdash/DataForVEGNN/ILPFeats"
trntstsplitdir="/home/dell5810/tdash/DataForVEGNN/TrainTestSplit"


#create the directory where the Results will be stored
resultdir="Result_GNN5_Czech"
mkdir $resultdir

#for each dataset in the list
for dataset in `cat datasets`
do
	echo "Working on: $dataset"

	#copy the input: train and test files to run dir
	rm -rf ./data/DS/*
	mkdir ./data/DS/raw
	cp $prefixdir/$dataset/DS_*.txt ./data/DS/raw/.
	
	##based on your choices, you need to un-comment the following(1-3)
	
	#1: without background knowledge (AB features)
	cat ./data/DS/raw/DS_node_attributes_bin.txt | cut -d, -f1-6 > ./data/DS/raw/DS_node_attributes.txt
	
	#2: with background knowledge (ABFR features)
	#mv ./data/DS/raw/DS_node_attributes_bin.txt ./data/DS/raw/DS_node_attributes.txt
	
	#3: with background knowledge (ABFR features) + concatenated Relational Features (HS)
	#paste -d "," ./data/DS/raw/DS_node_attributes_bin.txt $relfeatsdir/$dataset/HS_n1000/RelFeats.csv > ./data/DS/raw/DS_node_attributes.txt
	
	#copy the train_test split info
	cp $trntstsplitdir/$dataset/*_split ./data/DS/.

	#run the python program
	python main.py --dataset DS
	
	#store the results
	if [ -d ./$resultdir/$dataset ]
	then
		rm -rf ./$resultdir/$dataset
	fi
	mkdir ./$resultdir/$dataset

	#mv ./data/DS/* $resultdir/$dataset/.
	mv score.txt $resultdir/$dataset/.
	mv latest.pth $resultdir/$dataset/.
done



resultdir="Result_VEGNN5_Czech"
mkdir $resultdir

#for each dataset in the list
for dataset in `cat datasets`
do
	echo "Working on: $dataset"

	#copy the input: train and test files to run dir
	rm -rf ./data/DS/*
	mkdir ./data/DS/raw
	cp $prefixdir/$dataset/DS_*.txt ./data/DS/raw/.
	
	##based on your choices, you need to un-comment the following(1-3)
	
	#1: without background knowledge (AB features)
	#cat ./data/DS/raw/DS_node_attributes_bin.txt | cut -d, -f1-6 > ./data/DS/raw/DS_node_attributes.txt
	
	#2: with background knowledge (ABFR features)
	mv ./data/DS/raw/DS_node_attributes_bin.txt ./data/DS/raw/DS_node_attributes.txt
	
	#3: with background knowledge (ABFR features) + concatenated Relational Features (HS)
	#paste -d "," ./data/DS/raw/DS_node_attributes_bin.txt $relfeatsdir/$dataset/HS_n1000/RelFeats.csv > ./data/DS/raw/DS_node_attributes.txt
	
	#copy the train_test split info
	cp $trntstsplitdir/$dataset/*_split ./data/DS/.

	#run the python program
	python main.py --dataset DS
	
	#store the results
	if [ -d ./$resultdir/$dataset ]
	then
		rm -rf ./$resultdir/$dataset
	fi
	mkdir ./$resultdir/$dataset

	#mv ./data/DS/* $resultdir/$dataset/.
	mv score.txt $resultdir/$dataset/.
	mv latest.pth $resultdir/$dataset/.
done




resultdir="Result_VEGNN5_HS100_Czech"
mkdir $resultdir

#for each dataset in the list
for dataset in `cat datasets`
do
	echo "Working on: $dataset"

	#copy the input: train and test files to run dir
	rm -rf ./data/DS/*
	mkdir ./data/DS/raw
	cp $prefixdir/$dataset/DS_*.txt ./data/DS/raw/.
	
	##based on your choices, you need to un-comment the following(1-3)
	
	#1: without background knowledge (AB features)
	#cat ./data/DS/raw/DS_node_attributes_bin.txt | cut -d, -f1-6 > ./data/DS/raw/DS_node_attributes.txt
	
	#2: with background knowledge (ABFR features)
	#mv ./data/DS/raw/DS_node_attributes_bin.txt ./data/DS/raw/DS_node_attributes.txt
	
	#3: with background knowledge (ABFR features) + concatenated Relational Features (HS)
	paste -d "," ./data/DS/raw/DS_node_attributes_bin.txt $relfeatsdir/$dataset/HS_n100/RelFeats.csv > ./data/DS/raw/DS_node_attributes.txt
	
	#copy the train_test split info
	cp $trntstsplitdir/$dataset/*_split ./data/DS/.

	#run the python program
	python main.py --dataset DS

	#store the results
	if [ -d ./$resultdir/$dataset ]
	then
		rm -rf ./$resultdir/$dataset
	fi
	mkdir ./$resultdir/$dataset
	
	#mv ./data/DS/* $resultdir/$dataset/.
	mv score.txt $resultdir/$dataset/.
	mv latest.pth $resultdir/$dataset/.
done




resultdir="Result_VEGNN5_HS500_Czech"
mkdir $resultdir

#for each dataset in the list
for dataset in `cat datasets`
do
	echo "Working on: $dataset"

	#copy the input: train and test files to run dir
	rm -rf ./data/DS/*
	mkdir ./data/DS/raw
	cp $prefixdir/$dataset/DS_*.txt ./data/DS/raw/.
	
	##based on your choices, you need to un-comment the following(1-3)
	
	#1: without background knowledge (AB features)
	#cat ./data/DS/raw/DS_node_attributes_bin.txt | cut -d, -f1-6 > ./data/DS/raw/DS_node_attributes.txt
	
	#2: with background knowledge (ABFR features)
	#mv ./data/DS/raw/DS_node_attributes_bin.txt ./data/DS/raw/DS_node_attributes.txt
	
	#3: with background knowledge (ABFR features) + concatenated Relational Features (HS)
	paste -d "," ./data/DS/raw/DS_node_attributes_bin.txt $relfeatsdir/$dataset/HS_n500/RelFeats.csv > ./data/DS/raw/DS_node_attributes.txt
	
	#copy the train_test split info
	cp $trntstsplitdir/$dataset/*_split ./data/DS/.

	#run the python program
	python main.py --dataset DS
	
	#store the results
	if [ -d ./$resultdir/$dataset ]
	then
		rm -rf ./$resultdir/$dataset
	fi
	mkdir ./$resultdir/$dataset

	#mv ./data/DS/* $resultdir/$dataset/.
	mv score.txt $resultdir/$dataset/.
	mv latest.pth $resultdir/$dataset/.
done




resultdir="Result_VEGNN5_HS1000_Czech"
mkdir $resultdir

#for each dataset in the list
for dataset in `cat datasets`
do
	echo "Working on: $dataset"

	#copy the input: train and test files to run dir
	rm -rf ./data/DS/*
	mkdir ./data/DS/raw
	cp $prefixdir/$dataset/DS_*.txt ./data/DS/raw/.
	
	##based on your choices, you need to un-comment the following(1-3)
	
	#1: without background knowledge (AB features)
	#cat ./data/DS/raw/DS_node_attributes_bin.txt | cut -d, -f1-6 > ./data/DS/raw/DS_node_attributes.txt
	
	#2: with background knowledge (ABFR features)
	#mv ./data/DS/raw/DS_node_attributes_bin.txt ./data/DS/raw/DS_node_attributes.txt
	
	#3: with background knowledge (ABFR features) + concatenated Relational Features (HS)
	paste -d "," ./data/DS/raw/DS_node_attributes_bin.txt $relfeatsdir/$dataset/HS_n1000/RelFeats.csv > ./data/DS/raw/DS_node_attributes.txt
	
	#copy the train_test split info
	cp $trntstsplitdir/$dataset/*_split ./data/DS/.

	#run the python program
	python main.py --dataset DS
	
	#store the results
	if [ -d ./$resultdir/$dataset ]
	then
		rm -rf ./$resultdir/$dataset
	fi
	mkdir ./$resultdir/$dataset
	
	#mv ./data/DS/* $resultdir/$dataset/.
	mv score.txt $resultdir/$dataset/.
	mv latest.pth $resultdir/$dataset/.
done

