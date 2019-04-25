#!/bin/bash

# Additional file to get free gpu on a system/farm
# Assumes `gpustat` outputs a list and statistics of gpu usage
# Originally developed for the CMG GPU Machine at CERN

lines=$(gpustat | grep "\b[0-3]*[0-9]\b \\%")

while read -r line
do
    echo "Entering while for line $line"
    if [ -z ${freegpuid+x} ]; then
        freegpuid=$(( ${line:1:1} ))
        echo "Setting CUDA_VISIBLE_DEVICES to GPU $freegpuid"
        export CUDA_VISIBLE_DEVICES=$freegpuid
        echo $CUDA_VISIBLE_DEVICES
        break
    else
        echo "Free GPU already exists $freegpuid"
    fi
done <<< "$lines"

echo "CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"

# Note that bash variables don't persist outside the while loop (or pipes, not sure which one)
# So $freegpuid will be undefined here (outside the pipes/loop)
