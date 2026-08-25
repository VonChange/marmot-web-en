#!/bin/bash

# 国际版官网静态资源服务器启动脚本
# 默认端口 8080，可通过第一个参数指定

PORT=${1:-8080}
DIR="$(cd "$(dirname "$0")" && pwd)/html"

echo "启动 Marmot TV Remote 国际版官网静态服务器..."
echo "目录: $DIR"
echo "地址: http://localhost:$PORT"
echo ""

# 优先使用 Python 3，本地只需要预览静态文件，不引入 Node/React 依赖。
if command -v python3 &> /dev/null; then
    cd "$DIR" && python3 -m http.server "$PORT"
elif command -v python &> /dev/null; then
    cd "$DIR" && python -m http.server "$PORT"
elif command -v npx &> /dev/null; then
    npx serve "$DIR" -p "$PORT"
else
    echo "需要安装 Python 或 Node.js"
    exit 1
fi
