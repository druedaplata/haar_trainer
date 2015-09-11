#!/bin/bash

source CONFIG_HAAR.cfg

# SCRIPT 1:
# Create samples from positive images and negative ones.
while read image;
  do opencv_createsamples -img $positives_folder/$image -bg $negatives_folder/negatives.txt \
     -info $samples_folder/$image.txt -num $samples_per_image \
     -maxxangle ${xyz_angle[0]} -maxyangle ${xyz_angle[1]} -maxzangle ${xyz_angle[2]} \
     -bgcolor $bgcolor -bgthresh $bgthresh \
     -w ${img_dims[0]} -h ${img_dims[1]};
done<$positives_folder/positives.txt
