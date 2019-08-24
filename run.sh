#!/bin/bash

set -e

NCORE=8

# make output directory
mkdir output

# set variables
freesurfer=`jq -r '.freesurfer' config.json`

# copy data from freesurfer to output
cp -R ${freesurfer} ./output/

# set subjects directory for freesurfer
SUBJECTS_DIR=`pwd`

# run segmentation
segmentThalamicNuclei.sh output ${SUBJECTS_DIR}
