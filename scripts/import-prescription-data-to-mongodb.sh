#!/bin/sh

# Requires `PRESCRIPTION_DATA_URL` environment variable to be set

PRESCRIPTION_DATA_DIR=/tmp/prescription_data
PRESCRIPTION_DATA_FILE_PATH=$PRESCRIPTION_DATA_DIR/prescription_data.json

mkdir -p "$PRESCRIPTION_DATA_DIR" || exit 1
curl -o "$PRESCRIPTION_DATA_FILE_PATH" "$PRESCRIPTION_DATA_URL" || exit 1

mongoimport "$MONGODB_CONNECTION_STRING" \
    --db "$MONGODB_DB" \
    --collection "$MONGODB_COLLECTION" \
    --authenticationDatabase "$MONGODB_AUTH_DB" \
    --username "$MONGODB_USERNAME" \
    --password "$MONGODB_PASSWORD" \
    --drop --file \
    $PRESCRIPTION_DATA_FILE_PATH

rm -rf $PRESCRIPTION_DATA_DIR
