#!/usr/bin/env bash

host="$1"
port="$2"
shift 2

timeout="${WAIT_FOR_IT_TIMEOUT:-30}"
echo "⏳ Waiting for $host:$port to be available..."

while ! nc -z "$host" "$port"; do
  sleep 1
  timeout=$((timeout - 1))
  if [ "$timeout" -le 0 ]; then
    echo "❌ Timeout waiting for $host:$port"
    exit 1
  fi
done

echo "✅ $host:$port is available. Launching service..."
exec "$@"
