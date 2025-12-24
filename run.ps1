#!/usr/bin/env pwsh
# 国史科举·五经通考 - PowerShell 智能启动脚本
# 支持自动检测、安装依赖、启动应用

$ErrorActionPreference = "Stop"

function Write-Header {
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                                                            ║" -ForegroundColor Cyan
    Write-Host "║       🎓 国史科举·五经通考 - 启动助手                      ║" -ForegroundColor Cyan
    Write-Host "║                                                            ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Test-CommandExists {
    param($command)
    $null = Get-Command $command -ErrorAction SilentlyContinue
    return $?
}

try {
    Write-Header
    
    # 检查 Node.js
    Write-Host "🔍 检查环境..." -ForegroundColor Yellow
    
    if (-not (Test-CommandExists node)) {
        Write-Host "❌ Node.js 未安装！" -ForegroundColor Red
        Write-Host ""
        Write-Host "请按以下步骤安装:" -ForegroundColor Yellow
        Write-Host "1. 访问 https://nodejs.org/" -ForegroundColor White
        Write-Host "2. 下载并安装 LTS (长期支持) 版本" -ForegroundColor White
        Write-Host "3. 安装完成后，重新运行此脚本" -ForegroundColor White
        Write-Host ""
        Read-Host "按 Enter 键关闭此窗口"
        exit 1
    }
    
    Write-Host "✅ Node.js 已安装" -ForegroundColor Green
    $nodeVersion = & node --version
    Write-Host "   版本: $nodeVersion" -ForegroundColor Gray
    
    # 检查 npm
    if (-not (Test-CommandExists npm)) {
        Write-Host "❌ npm 未安装，但 Node.js 已安装" -ForegroundColor Red
        Write-Host "请重新安装 Node.js" -ForegroundColor Yellow
        Read-Host "按 Enter 键关闭此窗口"
        exit 1
    }
    
    Write-Host "✅ npm 已安装" -ForegroundColor Green
    $npmVersion = & npm --version
    Write-Host "   版本: $npmVersion" -ForegroundColor Gray
    
    # 检查项目文件
    Write-Host ""
    Write-Host "📂 检查项目文件..." -ForegroundColor Yellow
    
    $requiredFiles = @("main.js", "package.json", "index.html")
    foreach ($file in $requiredFiles) {
        if (-not (Test-Path $file)) {
            Write-Host "❌ 错误: $file 文件缺失" -ForegroundColor Red
            exit 1
        }
        Write-Host "✅ $file" -ForegroundColor Green
    }
    
    # 检查依赖
    Write-Host ""
    Write-Host "📦 检查依赖..." -ForegroundColor Yellow
    
    if (-not (Test-Path "node_modules")) {
        Write-Host "❌ node_modules 目录不存在" -ForegroundColor Yellow
        Write-Host "📥 正在安装依赖，请稍候..." -ForegroundColor Yellow
        Write-Host ""
        
        & npm install
        
        if ($LASTEXITCODE -ne 0) {
            Write-Host ""
            Write-Host "❌ 依赖安装失败" -ForegroundColor Red
            Write-Host "请检查网络连接后重试" -ForegroundColor Yellow
            Read-Host "按 Enter 键关闭此窗口"
            exit 1
        }
        
        Write-Host ""
        Write-Host "✅ 依赖安装完成" -ForegroundColor Green
    } else {
        Write-Host "✅ 依赖已安装" -ForegroundColor Green
    }
    
    # 启动应用
    Write-Host ""
    Write-Host "✨ 所有检查完成，准备启动应用..." -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 正在启动应用..." -ForegroundColor Cyan
    Write-Host ""
    
    & npm start
    
} catch {
    Write-Host ""
    Write-Host "❌ 发生错误: $_" -ForegroundColor Red
    Read-Host "按 Enter 键关闭此窗口"
    exit 1
}
