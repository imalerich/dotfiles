#! /bin/bash

GPU=$(nvidia-smi -q -d TEMPERATURE | grep 'GPU Current Temp' | cut -c39-40)
printf "%s° C" "$GPU"
