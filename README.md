# 国史科举·五经通考 - 桌面版

这是一个历史知识竞答应用的 Electron 桌面版本，可以独立运行，无需浏览器支持。

## 项目结构

```
Historygame/
├── main.js              # Electron 主进程
├── preload.js           # 预加载脚本（安全进程间通信）
├── index.html           # 应用界面（原始 HTML 文件）
├── package.json         # 项目配置和依赖
├── assets/              # 应用资源文件
│   └── icon.png         # 应用图标（可选）
└── README.md            # 说明文档
```

## 安装和运行

### 前置要求
- Node.js 12.0 或更高版本
- npm 或 yarn

### 安装依赖

```bash
npm install
```

### 开发模式运行

```bash
npm start
```

### 构建可执行文件

构建 macOS 版本：
```bash
npm run build-mac
```

构建 Windows 版本：
```bash
npm run build-win
```

构建 Linux 版本：
```bash
npm run build-linux
```

构建完成后，可执行文件将在 `dist/` 目录中生成。

## 功能特性

✅ 科举考试模式（乡试/殿试）  
✅ 知识闪卡背诵  
✅ 经史典籍复习资料  
✅ 错题管理系统  
✅ 排行榜统计  
✅ 游戏设置面板  
✅ 本地数据存储  

## 数据存储

所有用户数据（排行榜、错题、设置等）均保存在本地，不与外部服务器通信。

## 联系信息

上海市闵行区实验高级中学  
制作：邹子俊 & 李易

---

**版本 1.0.0**
