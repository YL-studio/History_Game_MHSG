# 🎓 国史科举·五经通考 - 桌面版使用指南

## 🎯 快速开始

### macOS 用户

1. **安装依赖并启动**
   ```bash
   chmod +x start.sh
   ./start.sh
   ```

2. **或者手动启动**
   ```bash
   npm install
   npm start
   ```

### Windows 用户

1. **直接双击**：`start.bat`

2. **或者打开命令提示符，输入**：
   ```cmd
   npm install
   npm start
   ```

### Linux 用户

```bash
chmod +x start.sh
./start.sh
```

---

## 📦 项目文件说明

| 文件 | 说明 |
|------|------|
| `main.js` | Electron 主进程，管理窗口和应用生命周期 |
| `preload.js` | 安全的进程通信脚本 |
| `index.html` | 应用的用户界面和所有功能代码 |
| `package.json` | 项目配置和依赖管理 |
| `start.sh` | macOS/Linux 快速启动脚本 |
| `start.bat` | Windows 快速启动脚本 |
| `README.md` | 项目简介 |

---

## 🏗️ 构建可执行程序

### 构建 macOS 版本（生成 .dmg 安装器）

```bash
npm run build-mac
```

生成的文件在 `dist/` 目录中。

### 构建 Windows 版本（生成 .exe）

```bash
npm run build-win
```

生成的文件在 `dist/` 目录中。

### 构建 Linux 版本（生成 AppImage）

```bash
npm run build-linux
```

生成的文件在 `dist/` 目录中。

---

## 🎮 功能说明

| 功能 | 说明 |
|------|------|
| **进京赶考** | 参加科举考试（乡试/殿试） |
| **知识闪卡** | 使用闪卡记忆历史知识 |
| **经史典籍** | 查阅各科复习资料 |
| **皇榜** | 查看排行榜 |
| **错题阁** | 查看和管理错题记录 |
| **游戏设置** | 调整游戏设置和管理数据 |

---

## 💾 数据存储

所有数据（包括排行榜、错题、设置等）都存储在本地，不会上传到任何服务器：

- **macOS**: `~/Library/Application Support/国史科举·五经通考/`
- **Windows**: `%APPDATA%\国史科举·五经通考\`
- **Linux**: `~/.config/国史科举·五经通考/`

---

## 🐛 常见问题

### Q: 启动时显示"Node.js 未安装"

**A**: 请从 [nodejs.org](https://nodejs.org/) 下载并安装 Node.js LTS 版本。

### Q: npm install 很慢

**A**: 可以使用国内镜像加速：
```bash
npm config set registry https://registry.npmmirror.com
npm install
```

### Q: 如何在其他电脑上运行这个应用？

**A**: 
- 方式 1：复制整个项目文件夹，在新电脑上运行 `npm install` 和 `npm start`
- 方式 2：使用本指南的"构建可执行程序"部分生成独立的可执行文件

### Q: 如何重置所有数据？

**A**: 在游戏设置界面点击对应的"清空"或"重置"按钮，或者删除数据存储文件夹。

---

## 👨‍💻 开发信息

- **框架**: Electron 27.0+
- **语言**: HTML5, CSS3, JavaScript (ES6+)
- **打包工具**: electron-builder
- **制作**: 邹子俊 & 李易
- **学校**: 上海市闵行区实验高级中学

---

## 📄 许可证

本项目为教育项目，仅供学习和教学使用。

---

**需要帮助？** 检查应用内的"关于本应用"部分或重新阅读本指南。
