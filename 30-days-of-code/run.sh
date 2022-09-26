#!/bin/bash

INPUT=input.txt
OUTPUT=output.txt

# Verify arguments
if [[ $# -ne 1 ]]; then
  echo "USAGE: $0 {{exercise_number}}"
  exit 1
fi

# Verify the input exercise number matches only one directory
if [[ $(ls -d $1* | wc -l) -ne 1 ]]; then
  echo "Exercise number $1 is ambiguous or does not exist"
  exit 1
fi

# Obtain the directory name
DIRNAME=$(ls -d $1* | head -1)

# Format src, just in case
go fmt $DIRNAME/*.go

# Run with input
out=$(cat $DIRNAME/$INPUT | go run $DIRNAME/*.go)

# Compare the result
if [[ $out != $(cat $DIRNAME/$OUTPUT) ]]; then
  diff $DIRNAME/$OUTPUT <(echo "$out") # using process substitution
  exit 1
fi

# Copy the main.go
cat $DIRNAME/main.go | pbcopy
