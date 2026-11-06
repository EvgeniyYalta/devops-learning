#!/bin/bash

for file in "$@"; do
    echo "Checking: $file"

    if [ -f "$file" ]; then
        echo "OK: file exists"
    else
        echo "ERROR: file not found"
    fi

    echo ""
done
