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
  TMP="/tmp/xrp-install.$$"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$URL" -o "$TMP" || { rm -f "$TMP"; red "下载失败：$URL"; exit 1; }
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$TMP" "$URL" || { rm -f "$TMP"; red "下载失败：$URL"; exit 1; }
  else
    red "需要 curl 或 wget 才能下载安装。"
    exit 1
  fi
  if [ ! -s "$TMP" ] || ! head -n1 "$TMP" | grep -q '^#!/bin/sh'; then
    rm -f "$TMP"
    red "下载内容异常，已取消安装。"
    exit 1
  fi
  install -m 755 "$TMP" "$BIN"
  rm -f "$TMP"
}

need_root
yellow "正在安装 XRP 面板..."
download
green "安装完成。"
yellow "正在进入 XRP 面板..."
if [ -r /dev/tty ] && [ -w /dev/tty ]; then
  exec "$BIN" </dev/tty >/dev/tty 2>&1
else
  exec "$BIN"
fi
