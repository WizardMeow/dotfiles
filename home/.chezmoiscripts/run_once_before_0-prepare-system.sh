#!/usr/bin/env bash

set -uo pipefail

on-ERR() {
  local status=$?
  echo >&2 Error executing run_once_before_0-prepare-system.sh
  exit ${status}
}

trap on-ERR ERR

if [[ "${CHEZMOI_VERBOSE:-}" == 1 ]]; then
  echo 0: prepare system

  if "${DEBUG_SCRIPTS:-false}"; then
    set -x
  fi
fi

case "$(lsb_release -is)" in
ManjaroLinux)
  sudo sed -i 's/^# ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf
  sudo pacman-mirrors --geoip -s -q
  sudo pacman -Syu --noconfirm
  sudo pacman -S yay git curl wget --noconfirm
  ;;

*) : ;;
esac
