#! /bin/bash

CPU=$(ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}')
printf "%s" "$CPU"
