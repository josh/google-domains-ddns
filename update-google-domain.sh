#!/bin/bash

set -e

update() {
  set -x
  curl \
    --fail \
    --show-error \
    --silent \
    --user "$USERNAME:$PASSWORD" \
    "https://domains.google.com/nic/update?hostname=$HOSTNAME"
}

RESPONSE=$(update)
echo "$RESPONSE"
[[ "$RESPONSE" =~ ^(good|nochg) ]]
