#!/bin/bash

if ! command -v tailscale &>/dev/null; then
  if [ "$(systemd-detect-virt)" == "wsl" ]; then
      echo "In WSL environment, skipping installation..."
  else
      echo "tailscale not found, installing..."
      curl -fsSL https://tailscale.com/install.sh | sh
  fi
fi
