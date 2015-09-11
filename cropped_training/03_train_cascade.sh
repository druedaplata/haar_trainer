#!/bin/bash

source CONFIG_HAAR.cfg

#SCRIPT 3:
# Begin training for haar classifier.
opencv_traincascade -data $haar_folder -vec $samples_folder/open.vec -bg $negatives_folder/negatives.txt -numPos $numPos -numNeg $numNeg -numStages $num_stages \
-precalcValBufSize ${mem_bufsize[0]} -precalcIdxBufSize ${mem_bufsize[1]} -featureType $feature_type -minHitRate $hit_rate -maxFalseAlarmRate $max_false_alarm \
-mode $mode -w ${img_dims[0]} -h ${img_dims[1]}

