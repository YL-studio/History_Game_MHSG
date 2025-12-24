# 🚀 EXE 构建和分发完整指南

## 概览

您现在有了完整的 Windows EXE 构建和分发系统。用户可以：
- ✅ 直接运行 EXE（无需 Node.js）
- ✅ 自动安装依赖（如果源代码运行）
- ✅ 无缝启动应用

---

## 📦 为您的项目添加的新文件

### 构建脚本
- `build.sh` - 跨平台自动化构建脚本（macOS/Linux）
- `build.bat` - Windows 自动化构建脚本

### 启动脚本
- `run.bat` - 智能启动脚本（自动检测、安装依赖、启动）
- `run.ps1` - PowerShell 高级启动脚本

### 文档
- `BUILD_EXE_GUIDE.md` - **完整的 EXE 构建指南**（阅读这个！）
- `BUILD_EXE_QUICK.txt` - 快速参考卡
- `USER_GUIDE.md` - 最终用户使用指南
- `NSIS_CONFIG.md` - NSIS 安装程序配置说明

### 配置文件
- `package.json` - 已更新，支持新的构建命令

---

## 🎯 三种分发方式

### 方式 1️⃣ NSIS 安装程序（推荐）

**生成方法：**
```bash
npm run build-win-installer
```

**特点：**
- 专业的安装向导
- 自动创建快捷方式
- 支持卸载
- 文件大小：50-80 MB

**分发给：** 学校、班级、正式发布


### 方式 2️⃣ 便携版 EXE（USB 友好）

**生成方法：**
```bash
npm run build-win-portable
```

**特点：**
- 无需安装，直接运行
- 可复制到 USB、网盘
- 文件大小：150-200 MB

**分发给：** 学生自带 USB、网盘共享


### 方式 3️⃣ 同时生成两个版本

**生成方法：**
```bash
npm run build-win
```

**特点：**
- 同时生成安装程序和便携版
- 用户可选择

**分发给：** 完整分发包

---

## 🔧 快速构建步骤

### 第 1 步：准备环境
```bash
# 确保已安装 Node.js 12+
node --version
npm --version
```

### 第 2 步：进入项目目录
```bash
cd /Users/zzj/Desktop/Historygame
```

### 第 3 步：安装依赖（如果之前未安装）
```bash
npm install
```

### 第 4 步：构建 EXE
```bash
# 推荐：生成安装程序
npm run build-win-installer

# 或生成便携版
npm run build-win-portable

# 或两个都生成
npm run build-win
```

### 第 5 步：找到生成的 EXE
```
dist/
├── 国史科举·五经通考 Setup 1.0.0.exe    # 安装程序
└── 国史科举·五经通考 1.0.0.exe          # 便携版
```

---

## 🎯 为最终用户准备的文件

### 如果分发 EXE
用户需要：
- ✅ `国史科举·五经通考 Setup 1.0.0.exe` （或便携版 EXE）
- ✅ `USER_GUIDE.md` （可选，使用说明）

### 如果分发源代码
用户需要：
- ✅ 完整的项目文件夹
- ✅ `run.bat` 或 `start.bat`（一键启动）
- ✅ `USER_GUIDE.md`（使用说明）
- ✅ `START_HERE.md`（快速开始）

---

## 🛠️ 自动化脚本说明

### `run.bat` - 最重要的脚本

**功能：**
- 检测 Node.js 是否已安装
- 检查项目文件完整性
- 如果 node_modules 不存在，自动运行 `npm install`
- 自动启动应用

**用户使用：**
```bash
双击 run.bat
或命令行：run.bat
```

**错误处理：**
- 如果 Node.js 未安装，会告知用户下载地址
- 如果项目文件缺失，会提示错误
- 如果网络错误，会提示重试

### `run.ps1` - PowerShell 脚本

**优点：**
- 更高级的诊断功能
- 彩色输出
- 更详细的错误信息

**使用：**
```powershell
powershell -ExecutionPolicy Bypass -File run.ps1
```

### `build.bat` / `build.sh` - 自动构建脚本

**功能：**
- 自动检查环境
- 自动安装依赖
- 自动清理旧文件
- 自动构建 EXE
- 显示输出位置

**使用：**
```bash
# Windows
build.bat win      # 生成 Windows 版本
build.bat all      # 生成所有平台

# macOS/Linux
chmod +x build.sh
./build.sh win
./build.sh all
```

---

## 📋 package.json 的新构建命令

```json
"build-win": "electron-builder --win nsis portable",
"build-win-installer": "electron-builder --win nsis --publish never",
"build-win-portable": "electron-builder --win portable --publish never"
```

**解释：**
- `nsis` - 生成 NSIS 安装程序
- `portable` - 生成便携版 EXE
- `--publish never` - 不上传到网络

---

## 🎯 推荐的分发流程

### 第 1 步：构建 EXE
```bash
npm run build-win-installer
```

### 第 2 步：测试 EXE
1. 在干净的 Windows 环境上测试
2. 验证安装程序正常工作
3. 验证快捷方式创建成功
4. 验证应用功能正常

### 第 3 步：准备分发
- `dist/国史科举·五经通考 Setup 1.0.0.exe` - 主要分发文件
- `USER_GUIDE.md` - 使用说明（可选）
- `CHANGELOG.md` - 更新日志（可选）

### 第 4 步：分发给用户
- 上传到学校网盘
- 发送邮件附件
- USB 记录棒
- GitHub Release

### 第 5 步：用户使用
1. 下载 EXE
2. 双击运行
3. 按照安装向导完成
4. 使用应用

---

## ✨ 额外功能

### 1. 自定义应用图标

在 `assets/` 文件夹中添加：
- `icon.ico` (512x512 或更大) - Windows 图标
- `icon.png` (512x512) - macOS 和 Linux 图标

重新构建即可应用图标。

### 2. 代码签名（高级）

如果需要对 EXE 进行代码签名，编辑 `package.json`：
```json
"win": {
  "certificateFile": "path/to/certificate.pfx",
  "certificatePassword": "your-password"
}
```

### 3. 自动更新（高级）

可以配置 electron-updater 来实现自动更新功能。

---

## 🔍 故障排除

### EXE 生成失败

**检查清单：**
1. Node.js 版本是否 >= 12.0？
   ```bash
   node --version
   ```

2. npm install 是否成功？
   ```bash
   npm install
   ```

3. 是否有足够的磁盘空间（>2GB）？

4. 网络连接是否正常？

5. 是否安装了 Visual C++ Build Tools？

**解决方案：**
```bash
# 清理缓存
rm -rf node_modules package-lock.json

# 重新安装
npm install

# 重新构建
npm run build-win-installer
```

### 用户运行 EXE 失败

**常见原因：**
- Windows 版本过旧
- Visual C++ Redistributable 未安装
- 磁盘空间不足
- 防火墙阻止

**解决方案：**
- 要求用户更新 Windows
- 安装 Visual C++ Redistributable
- 检查磁盘空间

---

## 📊 文件大小预期

| 文件 | 大小 | 原因 |
|------|------|------|
| 安装程序 .exe | 50-80 MB | 压缩的应用包 |
| 便携版 .exe | 150-200 MB | 包含完整运行时 |
| 安装后大小 | 200-300 MB | 解压+缓存 |

---

## 🎓 学习资源

推荐阅读顺序：
1. **BUILD_EXE_GUIDE.md** - 完整的构建指南
2. **BUILD_EXE_QUICK.txt** - 快速参考
3. **USER_GUIDE.md** - 用户使用指南
4. **NSIS_CONFIG.md** - 安装程序配置

---

## 📞 获取帮助

**技术问题：**
- 查看 BUILD_EXE_GUIDE.md 的故障排除部分
- 检查 Electron 官方文档

**用户支持：**
- 提供 USER_GUIDE.md
- 包含联系方式

---

## ✅ 下一步

### 立即操作
```bash
npm run build-win-installer
```

### 验证生成
```bash
ls -lh dist/
```

### 测试 EXE
在 Windows 上测试生成的 EXE 文件。

### 分发给用户
上传到学校网盘、邮件或 USB。

---

**现在您已经拥有了完整的 Windows EXE 构建和分发系统！** 🎉

用户只需双击 EXE，就能享受完整的历史知识竞答体验，无需任何技术知识！
