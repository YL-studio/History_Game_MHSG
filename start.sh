#!/bin/bash

# 检查 Node.js 是否已安装
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装。请访问 https://nodejs.org/ 安装 Node.js"
    exit 1
fi

echo "📦 正在安装依赖..."
npm install

if [ $? -eq 0 ]; then
    echo "✅ 依赖安装完成！"
    echo ""
    echo "🚀 启动应用..."
    npm start
else
    echo "❌ 依赖安装失败，请检查网络连接"
    exit 1
fi
