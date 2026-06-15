#!/bin/sh
set -eu

REPO="youshuangle-blip/xrp"
BRANCH="${XRP_BRANCH:-main}"
URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/xrp"
BIN="/usr/local/bin/xrp"

red(){ printf "\033[31m%s\033[0m\n" "$*"; }
green(){ printf "\033[32m%s\033[0m\n" "$*"; }
yellow(){ printf "\033[33m%s\033[0m\n" "$*"; }

need_root(){
  [ "$(id -u)" -eq 0 ] || { red "请用 root 运行：sudo sh install.sh"; exit 1; }
}

download(){
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$URL" -o "$BIN"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$BIN" "$URL"
  else
    red "需要 curl 或 wget 才能下载安装。"
    exit 1
  fi
}

need_root
yellow "正在安装 XRP 面板..."
download
chmod +x "$BIN"
green "安装完成。"
green "现在可以执行：xrp"
