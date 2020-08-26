#!/bin/sh

# Requires `PRESCRIPTION_DATA_URL` environment variable to be set

PRESCRIPTION_DATA_DIR=/tmp/prescription_data
PRESCRIPTION_DATA_FILE_PATH=$PRESCRIPTION_DATA_DIR/prescription_data.json

mkdir -p "$PRESCRIPTION_DATA_DIR" || exit 1
curl -o "$PRESCRIPTION_DATA_FILE_PATH" "$PRESCRIPTION_DATA_URL" || exit 1

echo "Downloaded prescription data to $PRESCRIPTION_DATA_FILE_PATH"
