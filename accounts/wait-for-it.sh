#!/usr/bin/env bash

host="$1"
port="$2"
shift 2

timeout="${WAIT_FOR_IT_TIMEOUT:-30}"
url="http://$host:$port/actuator/health"

echo "⏳ Waiting for $url to return top-level status UP..."

while true; do
  status=$(curl --silent --fail "$url" | grep -o '"status":"UP"' | head -n 1)

  if [ "$status" = '"status":"UP"' ]; then
    echo "✅ $url is healthy. Launching service..."
    exec "$@"
  fi

  timeout=$((timeout - 1))
  if [ "$timeout" -le 0 ]; then
    echo "❌ Timeout waiting for $url"
    exit 1
  fi

  sleep 1
done
