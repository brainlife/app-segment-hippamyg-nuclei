#!/bin/bash

set -e

NCORE=4

export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=$NCORE

# make output directory
mkdir output
mkdir output/output

# set variables
freesurfer=`jq -r '.freesurfer' config.json`

# copy data from freesurfer to output
cp -R ${freesurfer}/* ./output/output/

# set subjects directory for freesurfer
SUBJECTS_DIR=`pwd`/output

# run segmentation
segmentThalamicNuclei.sh output ${SUBJECTS_DIR}
