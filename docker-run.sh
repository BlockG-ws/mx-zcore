#!/bin/bash

command="node index.js --redis_host=${REDIS_HOST} --db_host=${MONGODB_HOST} \
  --db_user=${MONGODB_USER} --db_password=${MONGODB_PASSWORD} --db_port=${MONGODB_PORT} \
  --redis_port=${REDIS_PORT} --redis_password=${REDIS_PASSWORD} --port=${PORT} \
  --allowed_origins=${ALLOWED_ORIGINS} \
  --jwt_secret=${JWT_SECRET} \
  --color \
  "

if [ -n "$CDN_CACHE_HEADER" ]; then
  command+=" --http_cache_enable_cdn_header"
fi

if [ -n "$FORCE_CACHE_HEADER" ]; then
  command+=" --http_cache_enable_force_cache_header"
fi

if [ -n "$ENCRYPT_KEY" ]; then
  command+=" --encrypt_key=${ENCRYPT_KEY}"
fi

if [ "$ENCRYPT_ENABLE" = "true" ]; then
  command+=" --encrypt_enable "
fi

exec $command
