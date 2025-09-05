#!/bin/bash
set -e

PR_AUTHOR=$1
GITHUB_FILE=$2

# Extract filename without path and extension
FILENAME=$(basename "$GITHUB_FILE" .toml)

# Check if PR author matches filename
if [[ "$FILENAME" != "$PR_AUTHOR" ]]; then
    echo "::error::File $GITHUB_FILE must be named $PR_AUTHOR.toml, not $FILENAME.toml"
    exit 1
fi

echo "$GITHUB_FILE matches $PR_AUTHOR"
