#!/bin/bash

# Load all variables from configuration file
source CONFIG_HAAR.cfg

#######################################################

# SCRIPT 1:
# Create samples from positive images and negative ones.
while read image;
  do opencv_createsamples -img $positives_folder/$image -bg $negatives_folder/negatives.txt \
     -info $samples_folder/$image.txt -num $samples_per_image \
     -maxxangle ${xyz_angle[0]} -maxyangle ${xyz_angle[1]} -maxzangle ${xyz_angle[2]} \
     -bgcolor $bgcolor -bgthresh $bgthresh \
     -w ${img_dims[0]} -h ${img_dims[1]};
done<$positives_folder/positives.txt


######################################################

# SCRIPT 2:
# Combine all description files created into one.
cat $samples_folder/*.txt > $samples_folder/positive_samples.txt
# Create a .vec file using the newly created description file
opencv_createsamples -info $samples_folder/positive_samples.txt -bg $negatives_folder/negatives.txt -vec $samples_folder/open.vec -num $vec_number -w ${img_dims[0]} -h ${img_dims[1]}

######################################################

#SCRIPT 3:
# Begin training for haar classifier.
opencv_traincascade -data $haar_folder -vec $samples_folder/open.vec -bg $negatives_folder/negatives.txt -numPos $numPos -numNeg $numNeg -numStages $num_stages \
-precalcValBufSize ${mem_bufsize[0]} -precalcIdxBufSize ${mem_bufsize[1]} -featureType $feature_type -minHitRate $hit_rate -maxFalseAlarmRate $max_false_alarm \
-mode $mode -w ${img_dims[0]} -h ${img_dims[1]}
