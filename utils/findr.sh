#!/bin/bash

# First argument is the directory to search.
# Second argument is the file extension to search for, where the
# filename is a wildcard (matches all files with that extension).
find . -type f -name "*.md" | sort -R | head -n 1
