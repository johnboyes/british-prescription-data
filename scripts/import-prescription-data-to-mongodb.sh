#!/bin/bash

# Requires `PRESCRIPTION_DATA_URL` environment variable to be set

PRESCRIPTION_DATA_DIR=/tmp/prescription_data
PRESCRIPTION_DATA_FILE_PATH=$PRESCRIPTION_DATA_DIR/prescription_data.json

mkdir -p "$PRESCRIPTION_DATA_DIR" || exit 1

# We use jq to filter down to just the records array.
# This is so that each record is imported into MongoDB as an individual
# document, which is what we need for Kakfa to then import them successfully.
jq '.result.result.records' <(curl "$PRESCRIPTION_DATA_URL") > "$PRESCRIPTION_DATA_FILE_PATH"

mongoimport "mongodb+srv://$MONGODB_HOST" \
    --db "$MONGODB_DB" \
    --collection "$MONGODB_COLLECTION" \
    --authenticationDatabase "$MONGODB_AUTH_DB" \
    --username "$MONGODB_USERNAME" \
    --password "$MONGODB_PASSWORD" \
    --drop \
    --jsonArray \
    --file $PRESCRIPTION_DATA_FILE_PATH

rm -rf $PRESCRIPTION_DATA_DIR
