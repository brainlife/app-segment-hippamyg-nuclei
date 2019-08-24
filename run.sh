#!/bin/bash

set -e

NCORE=8

mkdir output
# set variables
freesurfer=`jq -r '.freesurfer' config.json`
cp -R ${freesurfer}/* ./output/

segmentThalamicNuclei.sh output ./
