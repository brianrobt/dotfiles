#!/bin/sh

find "$1" -type f -name "*.$2" | sort -R | head -n 1
