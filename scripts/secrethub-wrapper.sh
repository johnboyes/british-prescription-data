#!/bin/bash

# This script must be run from the project root directory

if [[ -z "${SECRETHUB_USERNAME}" ]]; then
  echo -n "What is your SecretHub username? "
  read -r SECRETHUB_USERNAME
  echo "To avoid being prompted again, run:"
  echo "    export SECRETHUB_USERNAME=your_username"
  echo "in the terminal, after this script has finished."
fi

secrethub run --var "user=$SECRETHUB_USERNAME" ./scripts/import-prescription-data-to-mongodb.sh
