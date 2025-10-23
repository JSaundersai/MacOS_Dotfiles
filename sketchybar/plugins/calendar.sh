#!/bin/bash

DATE=$(date '+%a %b %d')
TIME=$(date '+%H:%M')

sketchybar --set calendar label="$TIME  $DATE"
