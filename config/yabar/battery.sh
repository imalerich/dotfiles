#! /bin/bash

BAT=$(acpi --battery | awk '{ gsub(/[,%]/, ""); print $4 }')
printf "%d%%" $BAT
