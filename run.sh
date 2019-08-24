#!/bin/bash

set -e

NCORE=8

# set variables
freesurfer=`jq -r '.freesurfer' config.json`

segmentThalamicNuclei.sh output ${freesurfer}

# use output.json as product.Json
#echo "{\"track\": $(cat output.json)}" > product.json
#
## clean up
#rm -rf *.mif *.b ./tmp
