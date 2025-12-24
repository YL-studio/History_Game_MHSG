@echo off
REM 检查 Node.js 是否已安装
where node >nul 2>nul
if errorlevel 1 (
    echo ❌ Node.js 未安装。请访问 https://nodejs.org/ 安装 Node.js
    pause
    exit /b 1
)

echo 📦 正在安装依赖...
call npm install

if errorlevel 1 (
    echo ❌ 依赖安装失败，请检查网络连接
    pause
    exit /b 1
)

echo ✅ 依赖安装完成！
echo.
echo 🚀 启动应用...
call npm start
pause
