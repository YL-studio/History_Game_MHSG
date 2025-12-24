@echo off
REM 自动化构建和发布脚本 (Windows)
REM 用法: build.bat [win|mac|linux|all]

setlocal enabledelayedexpansion

set PLATFORM=%1
if "%PLATFORM%"=="" set PLATFORM=all

echo.
echo ============================================
echo 国史科举·五经通考 - 自动化构建
echo ============================================
echo 目标平台: %PLATFORM%
echo.

REM 检查 Node.js
where node >nul 2>nul
if errorlevel 1 (
    echo ❌ 错误: Node.js 未安装
    echo 请从 https://nodejs.org/ 下载安装 LTS 版本
    pause
    exit /b 1
)

echo ✅ Node.js 已检测到

REM 检查 npm
where npm >nul 2>nul
if errorlevel 1 (
    echo ❌ 错误: npm 未安装
    pause
    exit /b 1
)

echo ✅ npm 已检测到
echo.

REM 安装依赖
echo 📦 安装/更新依赖...
call npm install
if errorlevel 1 (
    echo ❌ 依赖安装失败
    pause
    exit /b 1
)

REM 清理旧构建
echo.
echo 🧹 清理旧构建文件...
if exist dist rmdir /s /q dist
if exist out rmdir /s /q out

REM 构建
echo.
if "%PLATFORM%"=="win" (
    echo 🔨 构建 Windows 版本...
    call npm run build-win
) else if "%PLATFORM%"=="mac" (
    echo 🔨 构建 macOS 版本...
    call npm run build-mac
) else if "%PLATFORM%"=="linux" (
    echo 🔨 构建 Linux 版本...
    call npm run build-linux
) else if "%PLATFORM%"=="all" (
    echo 🔨 构建所有平台...
    call npm run build
) else (
    echo ❌ 未知平台: %PLATFORM%
    echo 用法: build.bat [win^|mac^|linux^|all]
    pause
    exit /b 1
)

if errorlevel 1 (
    echo ❌ 构建失败
    pause
    exit /b 1
)

echo.
echo ✅ 构建完成！
echo.
echo 📁 输出文件位置: dist\
echo.
pause
