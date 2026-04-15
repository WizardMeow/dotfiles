function C() {
  local session_name git_root

  # 如果在 git 仓库里，就用仓库名
  if git_root=$(git rev-parse --show-toplevel 2>/dev/null); then
    session_name=${git_root##*/}
  else
    # 否则用当前目录名
    session_name=${PWD##*/}
  fi

  zellij -s "$session_name" --layout code
}

