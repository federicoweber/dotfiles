#!/bin/bash

# Recursivelly get the entire webiste

URL=$1
LOGFILE=./backup-logs

wget \
  --header="Accept: text/html" \
  --recursive \
  --no-clobber \
  --page-requisites \
  --html-extension \
  --convert-links \
  --domains $URL \
  --limit-rate=500k \
  --no-parent \
  --user-agent="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36" \
  $URL \
  | tee --append $LOGFILE
