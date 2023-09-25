#!/usr/bin/env bash

if [ -n "$clashdir" ]; then
  echo 1: Clash Installed
  exit 0
fi

set -uo pipefail

on-ERR() {
  local status=$?
  echo >&2 Error executing run_once_before_install-1-clash.sh
  exit ${status}
}

trap on-ERR ERR

if [[ "${CHEZMOI_VERBOSE:-}" == 1 ]]; then
  echo 1: Install Clash

  if "${DEBUG_SCRIPTS:-false}"; then
    set -x
  fi
fi

readonly clashtmp=/tmp/ShellClash.tar.gz
readonly clashdir=/usr/share/clash/
wget -mv https://cdn.jsdelivr.net/gh/juewuy/ShellClash/bin/ShellClash.tar.gz -O $clashtmp
sudo mkdir -p /usr/share/clash
sudo tar -zxf $clashtmp -C $clashdir
sudo chown -R root:root $clashdir

readonly profiles=("/etc/profile" "/etc/zprofile")
for profile in ${profiles[@]}; do
  sudo echo "" >>$profile
  sudo echo "# shellclash" >>$profile
  sudo echo "export clashdir=\"$clashdir\"" >>$profile
  sudo echo "alias clash=\"bash \$clashdir/clash.sh\"" >>$profile
done
