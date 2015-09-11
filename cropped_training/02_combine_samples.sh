#!/bin/bash

source CONFIG_HAAR.cfg

# SCRIPT 2:
# Combine all description files created into one.
cat $samples_folder/*.txt > $samples_folder/positive_samples.txt
# Create a .vec file using the newly created description file
opencv_createsamples -info $samples_folder/positive_samples.txt -bg $negatives_folder/negatives.txt -vec $samples_folder/open.vec -num $vec_number -w ${img_dims[0]} -h ${img_dims[1]}

