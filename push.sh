#!/bin/sh
# 用法: sh push.sh <GitHub用户名> <仓库名> <token>
set -e
U=${1:?need user}
R=${2:-assets-mirror}
T=${3:?need token}
git init -q 2>/dev/null || true
git add -A
git -c user.email=x@x -c user.name=x commit -qm res || true
git branch -M main
git remote remove origin 2>/dev/null || true
git remote add origin "https://$U:$T@github.com/$U/$R.git"
git push -u origin main
