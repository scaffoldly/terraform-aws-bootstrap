#!/bin/bash

set -e

export TOKEN="$1"
export ORG_NAME="$2"
export EMAIL="todo@cnuss.com"

curl  --request POST 'https://app.terraform.io/api/v2/organizations' \
      --header 'Authorization: Bearer '${TOKEN}'' \
      --header 'Content-Type: application/vnd.api+json' \
      --data-raw '{
                    "data": {
                      "type": "organizations",
                      "attributes": {
                        "name": "'"$ORG_NAME"'",
                        "email": "'"$EMAIL"'"
                      }
                    }
                  }'

curl  --request POST 'https://app.terraform.io/api/v2/organizations/'$ORG_NAME'/workspaces' \
      --header 'Authorization: Bearer '${TOKEN}'' \
      --header 'Content-Type: application/vnd.api+json' \
      --data-raw '{
                    "data": {
                      "type": "workspaces",
                      "attributes": {
                        "name": "bootstrap",
                        "operations": false
                      }
                    }
                  }'