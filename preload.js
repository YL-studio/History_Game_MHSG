const { contextBridge } = require('electron');

// 在这里可以暴露安全的API给渲染进程
contextBridge.exposeInMainWorld('electronAPI', {
  // 如果将来需要与主进程通信，可以在这里添加方法
});
