#!/bin/bash

# This script must be run from the project root directory

echo -n "What is your SecretHub username? "
read -r SECRETHUB_COLLABORATOR
ORG_NAME=agilepathway
REPO_NAME=british-prescription-data
ORG_AND_REPO="$ORG_NAME"/"$REPO_NAME"
COLLABORATOR_DIR="$ORG_AND_REPO"/"$SECRETHUB_COLLABORATOR"

echo -n "Enter the MongoDB host you noted down earlier: "
read -r SECRETHUB_MONGODB_HOST
echo "$SECRETHUB_MONGODB_HOST" | secrethub write "$COLLABORATOR_DIR"/mongodb-host

echo -n "Enter the MongoDB developer password you noted down earlier: "
read -r SECRETHUB_MONGODB_PASSWORD
echo "$SECRETHUB_MONGODB_PASSWORD" | secrethub write "$COLLABORATOR_DIR"/mongodb-password

echo "Thanks, if there were no errors above then your MongoDB connection details are now stored safely in SecretHub."
