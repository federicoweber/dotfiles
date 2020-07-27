#!/bin/bash

while getopts c:f:e: flag
do
  case "${flag}" in
    c) container=${OPTARG};;
    e) environment=${OPTARG};;
    f) filter=${OPTARG};;
  esac
done


if [ -z "$filter" ]
then
  docker exec $container /bin/bash -c "DD_TRACE_DEBUG=FALSE ENVIRONMENT=test $environment ./phpunit"
else
  docker exec $container /bin/bash -c "DD_TRACE_DEBUG=FALSE ENVIRONMENT=test $environment ./phpunit --filter $filter"
fi
