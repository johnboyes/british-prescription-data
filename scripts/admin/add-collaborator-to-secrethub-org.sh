#!/bin/bash

# You must be an administrator of the SecretHub org to run this script

SECRETHUB_COLLABORATOR=$1
ORG_NAME=agilepathway
REPO_NAME=british-prescription-data
ORG_AND_REPO="$ORG_NAME"/"$REPO_NAME"
COLLABORATOR_DIR="$ORG_AND_REPO"/"$SECRETHUB_COLLABORATOR"

if [[ -z "$SECRETHUB_COLLABORATOR" ]]; then
  echo "You must provide the SecretHub username of the collaborator, e.g."
  echo "    ./scripts/admin/add-collaborator-to-secrethub-org.sh the-username"
  exit 1
fi

secrethub org invite "$ORG_NAME" "$SECRETHUB_COLLABORATOR"

secrethub repo invite "$ORG_AND_REPO" "$SECRETHUB_COLLABORATOR"

secrethub acl set "$ORG_AND_REPO"/prod "$SECRETHUB_COLLABORATOR" write

secrethub mkdir "$COLLABORATOR_DIR"

secrethub acl set "$COLLABORATOR_DIR" "$SECRETHUB_COLLABORATOR" write

echo "$REPO_NAME" | secrethub write "$COLLABORATOR_DIR"/mongodb-db

echo "$REPO_NAME" | secrethub write "$COLLABORATOR_DIR"/mongodb-collection

echo "admin" | secrethub write "$COLLABORATOR_DIR"/mongodb-auth-db

echo "developer" | secrethub write "$COLLABORATOR_DIR"/mongodb-username
