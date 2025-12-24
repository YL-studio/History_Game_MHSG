#!/bin/bash
# 自动化构建和发布脚本（macOS/Linux）
# 用法: ./build.sh [win|mac|linux|all]

set -e

PLATFORM=${1:-all}
VERSION=$(grep '"version"' package.json | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')

echo "🚀 国史科举·五经通考 - 自动化构建"
echo "=================================="
echo "版本: $VERSION"
echo "目标平台: $PLATFORM"
echo ""

# 检查依赖
if ! command -v node &> /dev/null; then
    echo "❌ 错误: Node.js 未安装"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ 错误: npm 未安装"
    exit 1
fi

# 安装依赖
echo "📦 安装/更新依赖..."
npm install

# 清理旧构建
echo "🧹 清理旧构建文件..."
rm -rf dist/ out/

# 构建
case $PLATFORM in
    win)
        echo "🔨 构建 Windows 版本..."
        npm run build-win
        ;;
    mac)
        echo "🔨 构建 macOS 版本..."
        npm run build-mac
        ;;
    linux)
        echo "🔨 构建 Linux 版本..."
        npm run build-linux
        ;;
    all)
        echo "🔨 构建所有平台..."
        npm run build
        ;;
    *)
        echo "❌ 未知平台: $PLATFORM"
        echo "用法: ./build.sh [win|mac|linux|all]"
        exit 1
        ;;
esac

echo ""
echo "✅ 构建完成！"
echo "📁 输出目录: dist/"
echo ""
echo "🎉 现在您可以分享以下文件:"
ls -lh dist/ 2>/dev/null | tail -n +2 | awk '{print "   " $9 " (" $5 ")"}'
