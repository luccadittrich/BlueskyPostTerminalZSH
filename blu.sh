#!/bin/bash

HANDLE='' #INSERT YOUR BLUESKY USERNAME LIKE THIS: harrypotter.bsky.social
DID_URL="https://bsky.social/xrpc/com.atproto.identity.resolveHandle"
export DID=$(curl -G -s \
    --data-urlencode "handle=$HANDLE" \
    "$DID_URL" | jq -r .did)

# Verifica se foi passado algum argumento para o script
if [ -z "$1" ]; then
  echo "Erro: Nenhum texto fornecido para o post."
  exit 1
fi

# Limita o post a 300 caracteres
POST_TEXT=$1
if [ ${#POST_TEXT} -gt 300 ]; then
  echo "Erro: O post excede o limite de 300 caracteres."
  exit 1
fi

# Get an app password from here: https://staging.bsky.app/settings/app-passwords
export APP_PASSWORD= # INSERT YOUR PASSOWORD

# Get API key with the app password
API_KEY_URL='https://bsky.social/xrpc/com.atproto.server.createSession'
POST_DATA="{ \"identifier\": \"${DID}\", \"password\": \"${APP_PASSWORD}\" }"
export API_KEY=$(curl -s -X POST \
    -H 'Content-Type: application/json' \
    -d "$POST_DATA" \
    "$API_KEY_URL" | jq -r .accessJwt)

POST_FEED_URL='https://bsky.social/xrpc/com.atproto.repo.createRecord'
POST_DATETIME=$(date -u +%Y-%m-%dT%H:%M:%S.%3N)Z

POST_RECORD="{ \"collection\": \"app.bsky.feed.post\", \"repo\": \"${DID}\", \"record\": { \"text\": \"$POST_TEXT\", \"createdAt\": \"$POST_DATETIME\", \"\$type\": \"app.bsky.feed.post\" } }"
curl -# -O -X POST "$POST_FEED_URL"\
    -H "Authorization: Bearer ${API_KEY}" \
    -H 'Content-Type: application/json' \
    -d "$POST_RECORD"
