@echo off
REM 国史科举·五经通考 - 智能启动脚本 (Windows)
REM 自动检测环境、安装依赖、启动应用

setlocal enabledelayedexpansion

title 国史科举·五经通考 - 启动助手

cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║       🎓 国史科举·五经通考 - 智能启动助手                  ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM 检查 Node.js 是否已安装
echo 🔍 检查环境...
where node >nul 2>nul
if errorlevel 1 (
    echo.
    echo ❌ Node.js 未安装！
    echo.
    echo 请按以下步骤安装:
    echo 1. 访问 https://nodejs.org/
    echo 2. 下载并安装 LTS (长期支持) 版本
    echo 3. 安装完成后，重新运行此脚本
    echo.
    pause
    exit /b 1
)

echo ✅ Node.js 已安装
node --version

REM 检查 npm
where npm >nul 2>nul
if errorlevel 1 (
    echo ❌ npm 未安装，但 Node.js 已安装
    echo 请重新安装 Node.js
    pause
    exit /b 1
)

echo ✅ npm 已安装
call npm --version

echo.
echo 📂 检查项目文件...

REM 检查关键文件
if not exist "main.js" (
    echo ❌ 错误: main.js 文件缺失
    pause
    exit /b 1
)

if not exist "package.json" (
    echo ❌ 错误: package.json 文件缺失
    pause
    exit /b 1
)

if not exist "index.html" (
    echo ❌ 错误: index.html 文件缺失
    pause
    exit /b 1
)

echo ✅ 所有项目文件完整

echo.
echo 📦 检查依赖...

REM 检查是否需要安装依赖
if not exist "node_modules" (
    echo ❌ node_modules 目录不存在
    echo 正在安装依赖，请稍候...
    echo.
    call npm install
    if errorlevel 1 (
        echo ❌ 依赖安装失败
        echo 请检查网络连接后重试
        pause
        exit /b 1
    )
    echo ✅ 依赖安装完成
) else (
    echo ✅ 依赖已安装
)

echo.
echo ✨ 所有检查完成，准备启动应用...
echo.
timeout /t 2 /nobreak

REM 启动应用
echo 🚀 正在启动应用...
call npm start

if errorlevel 1 (
    echo.
    echo ❌ 应用启动失败
    echo 请查看上方错误信息
    pause
    exit /b 1
)
