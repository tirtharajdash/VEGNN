cat datasets | while read line; do a=`cat $1/$line/score.txt`; echo $line $a; done;
