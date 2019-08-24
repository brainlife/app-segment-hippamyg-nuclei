#!/bin/bash

set -e

NCORE=8

mkdir output
# set variables
freesurfer=`jq -r '.freesurfer' config.json`
cp -R ${freesurfer}/* ./output/

segmentThalamicNuclei.sh output ./

# use output.json as product.Json
#echo "{\"track\": $(cat output.json)}" > product.json
#
## clean up
#rm -rf *.mif *.b ./tmp
