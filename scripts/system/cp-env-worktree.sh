#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <destination_dir> <src_dir1> [<src_dir2> ...]"
    exit 1
    
fi

DEST_DIR="$1"
shift

if [ ! -d "$DEST_DIR" ]; then
    echo "Creating destination directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

for dir in "$@"; do
    if [ -d "$dir" ]; then
        ENV_FILE="$dir/.env"
        
        if [ -f "$ENV_FILE" ]; then
            PARENT_NAME=$(basename "$(cd "$dir" && pwd)")
            NEW_NAME="${PARENT_NAME}.env"
            
            cp "$ENV_FILE" "$DEST_DIR/$NEW_NAME"
            echo "Copied: $ENV_FILE  -->  $DEST_DIR/$NEW_NAME"
        else
            echo "Skipping: No .env found in $dir" >&2
        fi
    else
        echo "Error: '$dir' is not a valid source directory." >&2
    fi
done
