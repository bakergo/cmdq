#!/bin/bash

for i in {1..10} ; do
  # ./q sleep 1
  echo $i
  ./q echo $i
done
