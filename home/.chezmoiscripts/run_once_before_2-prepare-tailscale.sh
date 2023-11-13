#!/bin/bash

if ! command -v tailscale &>/dev/null; then
  echo "tailscale not found, installing..."
  curl -fsSL https://tailscale.com/install.sh | sh
fi
