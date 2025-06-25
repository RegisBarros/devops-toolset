#!/bin/bash
set -e

# List of essential tools to verify
TOOLS="bash curl redis-cli git ping dig nslookup ifconfig netstat vim htop unzip jq ssh less ps top"

for tool in $TOOLS; do
  if ! command -v $tool &> /dev/null; then
    echo "Error: Tool '$tool' is not installed or not in PATH."
    exit 1
  fi
done

echo "All essential tools are installed."
