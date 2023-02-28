#!/bin/bash

set -e

NCORE=8

export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=$NCORE

# make output directory
mkdir -p output
mkdir -p output/output
if [ ! -d output/output/scripts ]; then
	mkdir -p output/output/scripts
fi

# set variables
freesurfer=`jq -r '.freesurfer' config.json`

# copy data from freesurfer to output
cp -R ${freesurfer}/* ./output/output/
chmod -R +rw ./output

# set subjects directory for freesurfer
SUBJECTS_DIR=`pwd`/output

# run segmentation
if [ -f ./output/mri/T2.mgz ]; then
	segmentHA_T2.sh output ./output/mri/T2.mgz T2 1 ${SUBJECTS_DIR}
else
	segmentHA_T1.sh output ${SUBJECTS_DIR}
fi
