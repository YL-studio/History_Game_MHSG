#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
项目转换验证脚本
检查所有必要文件是否已正确创建
"""

import os
import sys

def check_files():
    """检查关键文件是否存在"""
    required_files = {
        'main.js': 'Electron 主进程',
        'preload.js': '安全通信脚本',
        'index.html': '应用用户界面',
        'package.json': '项目配置',
        'start.sh': 'macOS/Linux 启动脚本',
        'start.bat': 'Windows 启动脚本',
        'README.md': '项目说明',
        'SETUP_GUIDE.md': '详细使用指南',
        'START_HERE.md': '快速开始指南',
        '.gitignore': 'Git 配置'
    }
    
    base_dir = os.path.dirname(os.path.abspath(__file__))
    
    print("🔍 检查项目文件...\n")
    
    all_ok = True
    for filename, description in required_files.items():
        filepath = os.path.join(base_dir, filename)
        exists = os.path.isfile(filepath)
        status = "✅" if exists else "❌"
        print(f"{status} {filename:<20} - {description}")
        if not exists:
            all_ok = False
    
    print("\n" + "="*50)
    if all_ok:
        print("✨ 所有文件都已正确创建！")
        print("\n下一步：")
        print("1. npm install     # 安装依赖")
        print("2. npm start       # 启动应用")
    else:
        print("⚠️  某些文件缺失，请检查！")
    
    return all_ok

if __name__ == "__main__":
    success = check_files()
    sys.exit(0 if success else 1)
